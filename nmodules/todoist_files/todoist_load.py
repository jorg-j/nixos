#!/usr/bin/env python

import json
import os
import sys
from glob import glob

from loguru import logger
from todoist_api_python.api import TodoistAPI

logger.remove(0)
logger.add(sys.stderr, level="INFO")
logger.add(f"/home/jack/log.log", retention="1 month")


def reader(file):
    """
    The function reads a file, removes newlines, splits the data by commas, and returns the resulting
    list.

    :param file: The parameter "file" is a string that represents the name or path of the file that we
    want to read
    :return: The function `reader` takes a file name as input, reads the contents of the file, removes
    any newline characters, and splits the resulting string by commas. The function then returns the
    resulting list of strings.
    """
    with open(file, "r") as f:
        data = json.load(f)
    return data


def get_projects(api):
    """
    This function retrieves a list of projects from an API and creates a dictionary with project names
    as keys and project IDs as values.

    :param api: The `api` parameter is likely an object or instance of a class that provides methods for
    interacting with an API (Application Programming Interface). The `get_projects()` method is likely a
    method provided by this API that retrieves a list of projects
    :return: a dictionary object called `project_lookup` which contains the names and IDs of projects
    obtained from an API.
    """
    logger.info("Getting Projects")
    project_lookup = {}

    try:
        projects = api.get_projects()
        for project in projects:
            project_lookup[project.name] = project.id
    except Exception as error:
        logger.error(error)
    logger.info(f"Projects discovered: {len(project_lookup)}")
    return project_lookup


def add_task(file, projects, api, inbox):
    """
    The function adds a task to a project or inbox using data from a file, and logs any errors or
    successes.

    :param file: The file parameter is the path to the file containing the task information to be added
    :param projects: The `projects` parameter is a dictionary that maps project names to their
    corresponding project IDs in the task management system. If a project name is not found in the
    dictionary, the task will be added to the inbox
    :param api: It is likely an instance of an API client that allows the user to interact with a task
    management system, such as Todoist or Asana. The `add_task` method is likely a method provided by
    the API client that allows the user to add a new task to the task management system
    :param inbox: The "inbox" parameter is likely a reference to the default task list in the task
    management system being used. It is a place where tasks can be added without assigning them to a
    specific project or category
    """
    logger.info(f"Adding Task for: {file}")
    try:
        data = reader(file)
    except Exception as e:
        logger.error(e)
        quit()

    project = data.get("project_name", "Inbox")
    logger.info(f"Project: {project}")
    task = data.get("content")
    due = data.get("due_string")
    labels = data.get("labels", ["cron", "labelError"])
    priority = data.get("priority", 4)

    project_id = projects.get(project, inbox)

    try:
        task = api.add_task(
            task,
            project_id=project_id,
            due_string=due,
            due_lang="en",
            labels=labels,
            priority=priority,
        )
        logger.info(task)
    except Exception as error:
        logger.error(error)


def run():
    """
    This function checks for .txt files in a specific directory, adds the tasks in those files to a
    Todoist inbox project using the Todoist API, and then deletes the files.
    """
    files = glob(f"/home/jack/*.txt")
    if files:
        api = TodoistAPI(os.getenv("APIKEY"))
        projects = get_projects(api)
        inbox = projects.get("Inbox")

        for file in files:
            logger.info(f"Starting File: {file}")
            add_task(file, projects, api, inbox)
            os.remove(file)
        logger.info("Complete")
    else:
        logger.info("No tasks to add. Exiting...")


if __name__ == "__main__":
    run()
