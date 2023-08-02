cd ~/Documents
# High Level Struct

mkdir -p 10-19_Books_Documentation
mkdir -p 20-29_Programming_Software
mkdir -p 30-39_House
mkdir -p 40-49_Hobbies
mkdir -p 50-59_Work
mkdir -p 60-69_Major_Projects
mkdir -p 70-79_Backups_Archives

function treemake() {
    mkdir -p $1/$2_$3
}

# 10-19 Books
books="10-19_Books_Documentation/10_Books"
treemake $books 10.01 "Python"
treemake $books 10.02 "Linux"
treemake $books 10.03 "DevOps"
treemake $books 10.04 "Machine_Learning"
treemake $books 10.05 "Database"
treemake $books 10.06 "MagPi"
treemake $books 10.07 "Mindfullness"
treemake $books 10.08 "Project_Management"
treemake $books 10.09 "Series"
treemake $books 10.10 "Life_Productivity"
treemake $books 10.11 "For_Dummies"
treemake $books 10.12 "C"
treemake $books 10.13 "Git"
treemake $books 10.14 "Windows"
treemake $books 10.15 "VB"
treemake $books 10.16 "DataScience"
treemake $books 10.17 "Vim"
treemake $books 10.18 "Assembly"
treemake $books 10.19 "Software_Design"
treemake $books 10.20 "Algorithms"
treemake $books 10.21 "Excel"
treemake $books 10.22 "Java"
treemake $books 10.23 "Game_Design"
treemake $books 10.24 "CyberSecurity"
treemake $books 10.25 "Handwriting"
treemake $books 10.26 "DIY"
treemake $books 10.27 "Design"
treemake $books 10.28 "Mindfullness"
treemake $books 10.29 "Business"
treemake $books 10.30 "Arduino"
treemake $books 10.31 "Docker"

treemake $books 10.32 "Ruby"
treemake $books 10.33 "Rust"
treemake $books 10.34 "Tableau"
treemake $books 10.35 "Networking"
treemake $books 10.36 "Powershell"
treemake $books 10.37 "Gardening"

treemake $books 10.99 "Other"



mkdir -p 10-19_Books_Documentation/11_Documentation/11.01_Manuals

mkdir -p 10-19_Books_Documentation/12_Magazines/12.01_Popular_Mechanics
mkdir -p 10-19_Books_Documentation/12_Magazines/12.02_Coding

mkdir -p 10-19_Books_Documentation/13_Obsidian_Vaults/

mkdir -p 10-19_Books_Documentation/14_Xournal_Notes/
mkdir -p 10-19_Books_Documentation/14_Xournal_Notes/14.01_Notes
mkdir -p 10-19_Books_Documentation/14_Xournal_Notes/14.02_Recording

# 20-29 Programming
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.01_Ansible
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.02_Docker
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.03_NixOS
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.04_Vagrant
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.05_Applications
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.06_K8s
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.07_VirtualBox
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.08_Packer
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.09_Webhooks
mkdir -p 20-29_Programming_Software/20_Infrastructure/20.99_Docker_Storage

# Code
mkdir -p 20-29_Programming_Software/21_Code/21.01_Libraries
mkdir -p 20-29_Programming_Software/21_Code/21.02_RDL
mkdir -p 20-29_Programming_Software/21_Code/21.03_Machine_Learning
mkdir -p 20-29_Programming_Software/21_Code/21.04_Todoist
mkdir -p 20-29_Programming_Software/21_Code/21.05_DataManagement
mkdir -p 20-29_Programming_Software/21_Code/21.06_Bash_Code_Samples
mkdir -p 20-29_Programming_Software/21_Code/21.07_Python_Code_Samples
mkdir -p 20-29_Programming_Software/21_Code/21.08_Git
mkdir -p 20-29_Programming_Software/21_Code/21.09_OCR
mkdir -p 20-29_Programming_Software/21_Code/21.10_Decision
mkdir -p 20-29_Programming_Software/21_Code/21.11_Google_Coral
mkdir -p 20-29_Programming_Software/21_Code/21.12_Mac_Automation
mkdir -p 20-29_Programming_Software/21_Code/21.13_Photogrammetry
mkdir -p 20-29_Programming_Software/21_Code/21.14_POCs
mkdir -p 20-29_Programming_Software/21_Code/21.99_Personal_Project_Code

# templates
mkdir -p 20-29_Programming_Software/22_Templates/22.01_Docker
mkdir -p 20-29_Programming_Software/22_Templates/22.02_Python
mkdir -p 20-29_Programming_Software/22_Templates/22.03_Bash

# Database
mkdir -p 20-29_Programming_Software/23_Databases/23.01_Neo4J

# Embedded Systems
mkdir -p 20-29_Programming_Software/24_Embedded_Systems/24.01_ESP
mkdir -p 20-29_Programming_Software/24_Embedded_Systems/24.02_NanoPi
mkdir -p 20-29_Programming_Software/24_Embedded_Systems/24.03_M5Stack
mkdir -p 20-29_Programming_Software/24_Embedded_Systems/24.04_Arduino

# Equipment
mkdir -p 20-29_Programming_Software/25_Equipment/25.01_Moonlander
mkdir -p 20-29_Programming_Software/25_Equipment/25.02_Streamdeck


mkdir -p 20-29_Programming_Software/28_Repos/28.01_jorgj
mkdir -p 20-29_Programming_Software/28_Repos/28.02_VSCode_Snippets

mkdir -p 20-29_Programming_Software/29_Helpful_Scripts/29.01_Locating
mkdir -p 20-29_Programming_Software/29_Helpful_Scripts/29.02_Encryption
mkdir -p 20-29_Programming_Software/29_Helpful_Scripts/29.03_File_Transfer
mkdir -p 20-29_Programming_Software/29_Helpful_Scripts/29.04_Compression
mkdir -p 20-29_Programming_Software/29_Helpful_Scripts/29.05_File_Deduplication

# 30-39 House
mkdir -p 30-39_House/30_Mortgage_Documents/30.01_Forms
mkdir -p 30-39_House/30_Mortgage_Documents/30.02_Identity
mkdir -p 30-39_House/30_Mortgage_Documents/30.03_Bank_Statements
mkdir -p 30-39_House/30_Mortgage_Documents/30.04_Receipts_Transfers
mkdir -p 30-39_House/30_Mortgage_Documents/30.05_Inspection_Reports


mkdir -p 30-39_House/31_Bills/31.01_Utilities
mkdir -p 30-39_House/31_Bills/31.02_Invoices_Receipts


mkdir -p 30-39_House/32_Family/32.01_Tash
mkdir -p 30-39_House/32_Family/32.02_Dogs
mkdir -p 30-39_House/32_Family/32.03_Caleb_Logan
mkdir -p 30-39_House/32_Family/32.04_Leanne_Mark_Teri
mkdir -p 30-39_House/32_Family/32.05_Tash_Family
mkdir -p 30-39_House/32_Family/32.06_Pop

mkdir -p 30-39_House/33_Finances/33.01_Budget
mkdir -p 30-39_House/33_Finances/33.02_Equifax

mkdir -p 30-39_House/34_Assets_and_Equipment/34.01_SamsungFrame
mkdir -p 30-39_House/34_Assets_and_Equipment/34.02_Macbook
mkdir -p 30-39_House/35_Events_Trips/35.01_Gorillaz


# 40-49 Hobbies
mkdir -p 40-49_Hobbies/40_3dPrinting/40.01_STLs
mkdir -p 40-49_Hobbies/40_3dPrinting/40.02_Software
mkdir -p 40-49_Hobbies/40_3dPrinting/40.03_GCode
mkdir -p 40-49_Hobbies/40_3dPrinting/40.04_Moonlander
mkdir -p 40-49_Hobbies/40_3dPrinting/40.05_RPi
mkdir -p 40-49_Hobbies/40_3dPrinting/40.06_NanoPi

mkdir -p 40-49_Hobbies/41_LaserCutting/41.01_BurnFiles
mkdir -p 40-49_Hobbies/41_LaserCutting/41.02_Software
mkdir -p 40-49_Hobbies/41_LaserCutting/41.03_Documentation

mkdir -p 40-49_Hobbies/42_Games/42.01_Nintendo
mkdir -p 40-49_Hobbies/42_Games/42.02_Factorio
mkdir -p 40-49_Hobbies/42_Games/42.03_StardewValley
mkdir -p 40-49_Hobbies/42_Games/42.04_tic80


# 50-39 Work
mkdir -p 50-59_Work/50_Admin/50.01_Payslips
mkdir -p 50-59_Work/50_Admin/50.02_Contracts_Agreements
mkdir -p 50-59_Work/50_Admin/50.03_Resumes

# Clients
cat << EOF > 50-59_Work/51_Clients/new_client_structure.sh
mkdir -p 01_Documentation
mkdir -p 02_Projects
mkdir -p 03_Resources
mkdir -p 04_Sandbox
mkdir -p 05_Backups
EOF


mkdir -p 50-59_Work/51_Clients/51.01_Westpac
mkdir -p 50-59_Work/51_Clients/51.02_LegalAid_NSW

mkdir -p 50-59_Work/52_Tools/52.01_HyperScience
mkdir -p 50-59_Work/52_Tools/52.02_UiPath

mkdir -p 50-59_Work/53_Accounting/53.01_Tax_Pre2023
mkdir -p 50-59_Work/53_Accounting/53.02_Tax_2023


mkdir -p 50-59_Work/59_Archives/59.01_Kao
mkdir -p 50-59_Work/59_Archives/59.02_Kogan
mkdir -p 50-59_Work/59_Archives/59.03_RevealGroup
mkdir -p 50-59_Work/59_Archives/59.04_Target

# 60-69 Major Projects
mkdir -p 60-69_Major_Projects/60_FEG/60.01_Pictures
mkdir -p 60-69_Major_Projects/60_FEG/60.02_Submitted
mkdir -p 60-69_Major_Projects/60_FEG/60.03_Proof
mkdir -p 60-69_Major_Projects/60_FEG/60.04_Emails


# 70-79 Backups Archives
mkdir -p 70-79_Backups_Archives/70_Backups/70.01_RPi4B
mkdir -p 70-79_Backups_Archives/70_Backups/70.02_RPiZero
mkdir -p 70-79_Backups_Archives/70_Backups/70.03_DotFiles


mkdir -p 70-79_Backups_Archives/71_Archives/71.01_Zip
mkdir -p 70-79_Backups_Archives/71_Archives/71.02_PyCharm
mkdir -p 70-79_Backups_Archives/71_Archives/71.03_NoLongerMaintained
mkdir -p 70-79_Backups_Archives/71_Archives/71.04_ShellHistory

tree -d -L 3 > index.txt
tree > deep_index.txt




# Pictures
cd ~/Pictures

mkdir -p 10-19_Family
mkdir -p 20-29_Holidays_Trips
mkdir -p 30-39_Screenshots
mkdir -p 40-49_Inforgraphs
mkdir -p 50-59_Wallpapers

# 10-19_Family
mkdir -p 10-19_Family/10_Tash/10.01_Wedding
mkdir -p 10-19_Family/10_Tash/10.02_Tash
mkdir -p 10-19_Family/10_Tash/10.03_Private
mkdir -p 10-19_Family/11_Tash_and_Kids
mkdir -p 10-19_Family/12_Dogs
mkdir -p 10-19_Family/13_Dad
mkdir -p 10-19_Family/14_Mum_Mark_Teri

# 20-29_Holidays_Trips
mkdir -p 20-29_Holidays_Trips/20_Japan/20.01_2019
mkdir -p 20-29_Holidays_Trips/21_USA/21.01_2019
mkdir -p 20-29_Holidays_Trips/22_Australia

