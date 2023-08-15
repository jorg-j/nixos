#!/usr/bin/env python

from setuptools import setup, find_packages


setup(name='todoist_load',
    version='1.0',
    packages=find_packages(),
    scripts=["todoist_load.py"]
)