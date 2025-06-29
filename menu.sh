#!/bin/bash

while true; do
    clear
    echo "========= Linux + ML Command Menu ========="
    echo "1. Show current directory (pwd)"
    echo "2. List files (ls)"
    echo "3. Show current user (whoami)"
    echo "4. Show disk usage (df -h)"
    echo "5. Show memory usage (free -m)"
    echo "6. Create a new directory (mkdir)"
    echo "7. Delete a file (rm)"
    echo "8. Copy a file (cp)"
    echo "9. Move a file (mv)"
    echo "10. Edit file with nano"
    echo "11. Show running processes (ps)"
    echo "12. Search a file (find)"

    echo "--- Machine Learning Commands ---"
    echo "13. Create Virtual Environment (venv)"
    echo "14. Activate Virtual Environment"
    echo "15. Install ML Package (pip install)"
    echo "16. Launch Jupyter Notebook"
    echo "17. Run Python Script (ML Model)"
    echo "18. List Installed Python Packages"
    echo "19. Exit"
    echo "==========================================="
    read -p "Enter your choice [1-19]: " choice

    case $choice in
        1) pwd ;;
        2) ls -l ;;
        3) whoami ;;
        4) df -h ;;
        5) free -m ;;
        6)
            read -p "Enter directory name: " dname
            mkdir "$dname"
            ;;
        7)
            read -p "Enter file name to delete: " fname
            rm -i "$fname"
            ;;
        8)
            read -p "Source file: " src
            read -p "Destination: " dest
            cp "$src" "$dest"
            ;;
        9)
            read -p "Source file: " src
            read -p "Destination: " dest
            mv "$src" "$dest"
            ;;
        10)
            read -p "Enter file name to edit: " fname
            nano "$fname"
            ;;
        11) ps aux | less ;;
        12)
            read -p "Enter filename to search: " searchname
            find / -name "$searchname" 2>/dev/null
            ;;

        # ML-related Commands
        13)
            read -p "Enter virtual environment name: " venvname
            python3 -m venv "$venvname"
            echo "Virtual environment '$venvname' created."
            ;;
        14)
            read -p "Enter virtual environment name to activate: " venvname
            source "$venvname/bin/activate"
            ;;
        15)
            read -p "Enter package to install (e.g., numpy, pandas, sklearn): " pkg
            pip install "$pkg"
            ;;
        16)
            jupyter notebook
            ;;
        17)
            read -p "Enter python script filename (e.g., train_model.py): " pyfile
            python "$pyfile"
            ;;
        18)
            pip list | less
            ;;
        19)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Try again."
            ;;
    esac
    read -p "Press Enter to continue..."
done
