#!/bin/bash

# Here i will start by adding my function to display script usage
display_usage() {
    echo "Usage: $0"
    echo "This script initializes a new project."
    echo "Please provide the following information:"
    echo "    - Project name"
    echo "    - Project type (python or bash)"
}

# Function to set up a Python project with a virtual environment
setup_python_project() {
    # Create virtual environment using pip
    python3 -m venv venv
    echo "Virtual environment 'venv' created."

    # Activate the virtual environment
    source venv/bin/activate
    echo "Virtual environment activated."
}

# Function to create README for Bash projects
create_bash_readme() {
    local project_name=$1
    echo "# $project_name" > README.md
    echo "## Setup Instructions" >> README.md
    echo "..." >> README.md
    echo "## Quick Start Guide" >> README.md
    echo "..." >> README.md

    echo "To run Bash scripts in this project, use the following command:"
    echo "./$project_name.sh"
    echo "To allow execution permissions for the script, run:"
    echo "chmod +x $project_name.sh"
}

# Prompt the user for project name
read -p "Enter project name: " project_name

# Prompt the user for project type
read -p "Enter project type (python or bash): " project_type

# Check if project name is provided
if [ -z "$project_name" ]; then
    echo "Project name not specified."
    display_usage
    exit 1
fi

# Check if project type is provided
if [ -z "$project_type" ]; then
    echo "Project type not specified."
    display_usage
    exit 1
fi

# Create the project directory
mkdir "$project_name"
cd "$project_name"

# Set up project based on project type
case "$project_type" in
    python)
        setup_python_project
        ;;
    bash)
        create_bash_readme "$project_name"

        # Create a Bash starter file
        touch "$project_name.sh"
        echo "#!/bin/bash" >> "$project_name.sh"
        echo 'echo "Hello, Bash!"' >> "$project_name.sh"
        echo "Bash starter file '$project_name.sh' created."
        ;;
    *)
        echo "Invalid project type. Supported types: python, bash."
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

# Suggest creating a ~/bin directory
echo "To make the script globally accessible, it is recommended to create a '~/bin' directory."

# Add ~/bin to the user's PATH
echo "To add '~/bin' to your PATH, you can append the following line to your shell profile (e.g., ~/.bashrc or ~/.bash_profile):"
echo 'export PATH="$HOME/bin:$PATH"'

# Move the script to ~/bin and make it executable
echo "To make the script globally accessible, move it to the '~/bin' directory and make it executable."
echo "For example, you can run the following commands:"
echo "mkdir -p ~/bin"
echo "mv $0 ~/bin/init_project"
echo "chmod +x ~/bin/init_project"

# Instruct the user to reload the shell profile
echo "To apply the changes, reload your shell profile by running the appropriate command:"
echo "source ~/.bashrc   # for Bash"
echo "source ~/.bash_profile   # for macOS"

echo "Please test the script from different locations to ensure it is globally accessible."
