#!/bin/bash

# I am prompting the user for the project name
read -p "Enter project name: " project_name

# Then here prompting the user to select project type
echo "Select project type:"
echo "1. Python"
echo "2. Bash"
read -p "Enter your choice: " project_type

# Create the project directory
mkdir "$project_name"
cd "$project_name"

# Create project-specific files and directories
case "$project_type" in
    1)
        # Python project
        # Create virtual environment using pip
        python3 -m venv venv
        echo "Virtual environment 'venv' created."

        # Activate the virtual environment
        source venv/bin/activate
        echo "Virtual environment activated."

        # Create a Python starter file
        touch "$project_name.py"
        echo "#!/usr/bin/env python3" >> "$project_name.py"
        echo 'print("Hello, Python!")' >> "$project_name.py"
        echo "Python starter file '$project_name.py' created."
        ;;
    2)
        # Bash project
        # Create a README file with run instructions
        echo "# $project_name" > README.md
        echo "## Setup Instructions" >> README.md
        echo "..." >> README.md
        echo "## Quick Start Guide" >> README.md
        echo "..." >> README.md

        # Create a Bash starter file
        touch "$project_name.sh"
        echo "#!/bin/bash" >> "$project_name.sh"
        echo 'echo "Hello, Bash!"' >> "$project_name.sh"
        echo "Bash starter file '$project_name.sh' created."

        # Provide instructions for running Bash scripts
        echo "To run the Bash script, use the following command:"
        echo "./$project_name.sh"
        echo "To allow execution permissions for the script, run:"
        echo "chmod +x $project_name.sh"
        ;;
    *)
        echo "Invalid project type."
        exit 1
        ;;
esac

# Create a general README file with setup and quick start guide
echo "# $project_name" > README.md
echo "## Setup Guide" >> README.md
echo "..." >> README.md
echo "## Quick Start" >> README.md
echo "..." >> README.md

echo "Project environment set up successfully."
