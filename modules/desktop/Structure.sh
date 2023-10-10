cd ~/Documents
# High Level Struct

high_level() {
        mkdir -p 10-19_Books_Documentation
        mkdir -p 20-29_Programming_Software
        mkdir -p 30-39_House
        mkdir -p 40-49_Hobbies
        mkdir -p 50-59_Work
        mkdir -p 60-69_Major_Projects
        mkdir -p 70-79_Backups_Archives
        }
high_level

treemake() {
        printf -v pos "%02d" $counter
        mkdir -p $1/"$index1.$pos"_$2
        #echo $1/"$index1.$pos"_$2
        counter=$((counter+1))
        }


# 10-19 Books
10_19() {
        function process_books() {
                counter=01
                books="10-19_Books_Documentation/10_Books_Programming"
                index1=10
                treemake $books "Python"
                treemake $books "Linux"
                treemake $books "Docker"
                treemake $books "DevOps"
                treemake $books "Machine_Learning"
                treemake $books "Database"
                treemake $books "MagPi"
                treemake $books "Project_Management"
                treemake $books "Agile"
                treemake $books "OOP"
                treemake $books "Virtualisation"
                treemake $books "Git"
                treemake $books "IOT_Edge"
                treemake $books "DataScience"
                treemake $books "WebAssembly"
                treemake $books "WebSites"
                treemake $books "C"
                treemake $books "Windows"
                treemake $books "VB"
                treemake $books "Vim"
                treemake $books "Software_Design"
                treemake $books "Algorithms"
                treemake $books "Excel"
                treemake $books "CyberSecurity"
                treemake $books "Arduino"
                treemake $books "Game_Design"
                treemake $books "Cloud_Computing"
                treemake $books "Javascript"
                treemake $books "Java"
                treemake $books "Ruby"
                treemake $books "Powershell"
                treemake $books "Networking"
                treemake $books "Assembly"
                treemake $books "Rust"
                treemake $books "Tableau"
                treemake $books "GUI"
                treemake $books "SSL"
                treemake $books "XML"
                treemake $books "TOR"
                treemake $books "Big_Data"
                treemake $books "Series"
                mkdir -p $books"/10.99_Other"
                }
        process_books

        # 11 Non Programming
        function process_non_programming_books() {
                counter=01
                books="10-19_Books_Documentation/11_Books_Home_Lifestyle_Other"
                index1=11
                treemake $books "Life_Productivity"
                treemake $books "Gardening"
                treemake $books "Mindfullness"
                treemake $books "Design"

                treemake $books "For_Dummies"
                treemake $books "Business"
                treemake $books "Handwriting"
                treemake $books "DIY"
                treemake $books "Travel"
                treemake $books "Art_Craft"
                treemake $books "Finance"
                treemake $books "Solar"
                treemake $books "Management"
                treemake $books "Cooking"
                treemake $books "Cleaning"
                }
        process_non_programming_books

        # Magazines
        function magazines() {
                mkdir -p 10-19_Books_Documentation/12_Magazines/12.01_Popular_Mechanics
                mkdir -p 10-19_Books_Documentation/12_Magazines/12.02_Coding
                mkdir -p 10-19_Books_Documentation/12_Magazines/12.03_Popular_Science
                }
        magazines

        mkdir -p 10-19_Books_Documentation/13_Obsidian_Vaults/

        mkdir -p 10-19_Books_Documentation/14_Xournal_Notes/
        mkdir -p 10-19_Books_Documentation/14_Xournal_Notes/14.01_Notes
        mkdir -p 10-19_Books_Documentation/14_Xournal_Notes/14.02_Recording

        mkdir -p 10-19_Books_Documentation/15_Documentation/15.01_Manuals
        mkdir -p 10-19_Books_Documentation/16_Supernote
        }
10_19

# 20-29 Programming
20_29() {
        programming_software() {
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.01_Ansible
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.02_Docker
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.03_NixOS
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.04_Vagrant
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.05_Applications
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.06_K8s
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.07_VirtualBox
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.08_Packer
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.09_Webhooks
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.10_Homer
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.11_Distrobox
                mkdir -p 20-29_Programming_Software/20_Infrastructure/20.99_Docker_Storage
                }
        programming_software

        # Code
        code() {
                counter=01
                code_path="20-29_Programming_Software/21_Code"
                index1=21
                treemake $code_path "Libraries"
                treemake $code_path "RDL"
                treemake $code_path "Machine_Learning"
                treemake $code_path "Todoist"
                treemake $code_path "DataManagement"
                treemake $code_path "Bash_Code_Samples"
                treemake $code_path "Python_Code_Samples"
                treemake $code_path "Git"
                treemake $code_path "OCR"
                treemake $code_path "Decision"
                treemake $code_path "Google_Coral"
                treemake $code_path "Mac_Automation"
                treemake $code_path "Photogrammetry"
                treemake $code_path "POCs"
                treemake $code_path "Keyboards"
                treemake $code_path "Personal_Project_Code"
                } 
        code


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
        }
20_29

# 30-39 House
30_39() {
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
        }
30_39

# 40-49 Hobbies
40_49() {
        mkdir -p 40-49_Hobbies/40_3dPrinting/40.01_STLs
        mkdir -p 40-49_Hobbies/40_3dPrinting/40.02_Software
        mkdir -p 40-49_Hobbies/40_3dPrinting/40.03_GCode
        mkdir -p 40-49_Hobbies/40_3dPrinting/40.04_Moonlander
        mkdir -p 40-49_Hobbies/40_3dPrinting/40.05_RPi
        mkdir -p 40-49_Hobbies/40_3dPrinting/40.06_NanoPi

        mkdir -p 40-49_Hobbies/41_LaserCutting/41.01_BurnFiles
        mkdir -p 40-49_Hobbies/41_LaserCutting/41.02_Software
        mkdir -p 40-49_Hobbies/41_LaserCutting/41.03_Documentation
        mkdir -p 40-49_Hobbies/41_LaserCutting/41.04_Assets

        mkdir -p 40-49_Hobbies/42_Games/42.01_Nintendo
        mkdir -p 40-49_Hobbies/42_Games/42.02_Factorio
        mkdir -p 40-49_Hobbies/42_Games/42.03_StardewValley
        mkdir -p 40-49_Hobbies/42_Games/42.04_tic80
        }
40_49

# 50-59 Work
50_59() {
        mkdir -p 50-59_Work/50_Admin/50.01_Payslips
        mkdir -p 50-59_Work/50_Admin/50.02_Contracts_Agreements
        mkdir -p 50-59_Work/50_Admin/50.03_Resumes

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
        }
50_59


# 60-69 Major Projects
60_69() {
        mkdir -p 60-69_Major_Projects/60_FEG/60.01_Pictures
        mkdir -p 60-69_Major_Projects/60_FEG/60.02_Submitted
        mkdir -p 60-69_Major_Projects/60_FEG/60.03_Proof
        mkdir -p 60-69_Major_Projects/60_FEG/60.04_Emails
        }
60_69

# 70-79 Backups Archives
70_79() {
        mkdir -p 70-79_Backups_Archives/70_Backups/70.01_RPi4B
        mkdir -p 70-79_Backups_Archives/70_Backups/70.02_RPiZero
        mkdir -p 70-79_Backups_Archives/70_Backups/70.03_DotFiles


        mkdir -p 70-79_Backups_Archives/71_Archives/71.01_Zip
        mkdir -p 70-79_Backups_Archives/71_Archives/71.02_PyCharm
        mkdir -p 70-79_Backups_Archives/71_Archives/71.03_NoLongerMaintained
        mkdir -p 70-79_Backups_Archives/71_Archives/71.04_ShellHistory
        }
70_79



# Clients
cat << EOF > 50-59_Work/51_Clients/new_client_structure.sh
mkdir -p 01_Documentation
mkdir -p 02_Projects
mkdir -p 03_Resources
mkdir -p 04_Meetings
mkdir -p 98_Sandbox
mkdir -p 99_Backups
EOF


tree -d -L 3 > index.txt
tree > deep_index.txt


# Pictures
pictures() {
        cd ~/Pictures

        mkdir -p 10-19_Family
        mkdir -p 20-29_Holidays_Trips
        mkdir -p 30-39_Screenshots
        mkdir -p 40-49_Infographs
        mkdir -p 50-59_Wallpapers
        mkdir -p 60-69_Proof_Receipts

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
        }
pictures

# videos
videos() {
        cd ~/Videos

        mkdir -p 10-19_ScreenRecordings



        mkdir -p 10-19_ScreenRecordings/10_Demos/10.01_Khan
        mkdir -p 10-19_ScreenRecordings/10_Demos/10.02_Decision
        mkdir -p 10-19_ScreenRecordings/10_Demos/10.03_ImageHash
        mkdir -p 10-19_ScreenRecordings/10_Demos/10.04_BarcodeReader

        mkdir -p 10-19_ScreenRecordings/11_Training/11.01_Software
        mkdir -p 10-19_ScreenRecordings/11_Training/11.02_Doug

        mkdir -p 10-19_ScreenRecordings/12_Information/12.01_Ansible
        mkdir -p 10-19_ScreenRecordings/12_Information/12.02_Vagrant
        mkdir -p 10-19_ScreenRecordings/12_Information/12.03_Todoist

        }
videos
