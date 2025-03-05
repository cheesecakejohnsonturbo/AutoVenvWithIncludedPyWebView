MyProjectTools/  (Root launcher directory - where you run main.bat from)
├── main.bat

└── autovenv/    (Directory containing all menu scripts and Python environment)
├── menu.bat
├── run_webui.py
├── setup_venv.bat
├── pywebview_venv.bat
├── pywebview_git_clone.bat
├── local_python.bat
├── requirements.txt
└── venv/

## Script Descriptions

Here's a description of each batch script and its purpose:

1.  **`code_consolidate.bat` - Batch Code Summary Generator**

    *   **Purpose:**  This script is a utility to consolidate all `.bat` files within the same directory into a single text file (`batch_code_summary.txt`). This is useful for:
        *   Reviewing all your batch script code in one document for easier analysis and understanding.
        *   Identifying potential code duplication across scripts for consolidation and optimization.
        *   Archiving previous versions of the summary file before generating a new one.
    *   **Usage:** Run `code_consolidate.bat` directly. It presents a menu with options to:
        1.  **Export with date and filename:** Creates `batch_code_summary.txt` with headers for each script including filename and date of generation.
        2.  **Consolidate code only:** Creates `batch_code_summary.txt` containing only the code from each `.bat` file, without headers.
        3.  **Exit:** Closes the script.
    *   **Output:** Generates a text file named `batch_code_summary.txt` in the `bat_consolidate` subdirectory (which will be created if it doesn't exist). Previous versions of `batch_code_summary.txt` are archived in the `bat_consolidate\archive` subdirectory.

2.  **`launch.bat` - PyWebView Viewport Launcher**

    *   **Purpose:** A simple launcher script to quickly run the `run_webui.py` Python script, which in turn launches a PyWebView viewport.
    *   **Usage:** Run `launch.bat` directly. It executes `run_webui.py` using the Python interpreter from the virtual environment (`venv\Scripts\python.exe`).
    *   **Note:**  This script provides a direct way to launch the default PyWebView viewport without going through the main menu.

3.  **`local_python.bat` - Interactive Python Shell in Virtual Environment**

    *   **Purpose:** Provides an interactive Python command-line environment that is running within the project's virtual environment (`venv`). This allows you to execute Python code, test libraries, and use `pip` package manager with the correct environment activated.
    *   **Usage:** Run `local_python.bat` directly or select the "Run arbitrary python commands (careful)" option from the Python Menu in `menu.bat`.
    *   **Features:**
        *   Activates the virtual environment before starting the Python shell.
        *   Presents a command prompt (`>>> `) where you can type Python or `pip` commands.
        *   Supports the following commands:
            *   `python <python commands>`: Executes arbitrary Python code within the venv.
            *   `pip <pip commands>`: Executes `pip` commands (e.g., `install`, `uninstall`, `list`) within the venv.
            *   `exit`: Returns to the main menu (if launched from `menu.bat`) or exits the `local_python.bat` script.
        *   Deactivates the virtual environment upon exiting the interactive shell.

4.  **`menu.bat` - Main Menu System**

    *   **Purpose:**  The central menu script that provides an interactive text-based interface to access all the features and utilities of the PyWebView launcher.
    *   **Usage:** Run `main.bat` (located in the parent directory) or `menu.bat` directly (located in the `autovenv` subdirectory).
    *   **Menu Structure:**
        *   **Main Menu:**
            1.  Quick Launch PyWebViewViewport: Runs `launch.bat` (and thus `run_webui.py`).
            2.  Go to Setup:  Navigates to the Setup Menu.
            3.  Go to Python menu: Navigates to the Python Menu.
            4.  Go to PyWebView menu: Navigates to the PyWebView Menu.
            5.  Quit: Exits the menu system.
        *   **Setup Menu:**
            1.  Install VENV: Runs `setup_venv.bat` to create or verify the Python virtual environment.
            2.  PIP Install PyWebView:  Installs the `pywebview` package into the virtual environment using `pip install pywebview`.
            3.  View Readme.md:  *Feature not yet implemented*. Intended to display the `readme.md` file for the current project in a PyWebView viewport.
            4.  View License: *Feature not yet implemented*. Intended to display a license file for the current project in a PyWebView viewport.
            5.  Exit: Returns to the Main Menu.
        *   **Python Menu:**
            1.  Run arbitrary python commands (careful): Launches `local_python.bat` for interactive Python commands in the venv.
            2.  Show python version: Displays the Python version used within the virtual environment.
            3.  Upgrade PIP: Upgrades the `pip` package manager within the virtual environment to the latest version.
            4.  Install requirements.txt file (locally): Installs all Python packages listed in the `requirements.txt` file into the virtual environment using `pip install -r requirements.txt`.
            5.  Return: Returns to the Main Menu.
        *   **PyWebView Menu:**
            1.  Git Clone PyWebView repository (only to review its code): Runs `pywebview_git_clone.bat` to clone the PyWebView GitHub repository (primarily for code review, not required for using PyWebView).
            2.  Return: Returns to the Main Menu.

5.  **`pywebview_git_clone.bat` - Clone PyWebView Repository (Optional Utility)**

    *   **Purpose:**  A utility script to clone the official PyWebView GitHub repository to your local machine. This is mainly intended for developers who want to inspect the PyWebView source code, contribute to the project, or build PyWebView from source. It's not necessary for simply using PyWebView in your own applications.
    *   **Usage:** Run `pywebview_git_clone.bat` directly or select the option from the PyWebView Menu in `menu.bat`.
    *   **Action:** Executes `git clone https://github.com/r0x0r/pywebview` in the current directory. Requires Git to be installed and in your system's PATH environment variable.

6.  **`py_menu.bat` -  *Potentially Redundant Python Menu (Consider Integration)* **

    *   **Purpose:**  Appears to be a simplified, separate menu focused on basic Python virtual environment and interactive shell tasks.
    *   **Usage:** Run `py_menu.bat` directly.
    *   **Menu Options:**
        1.  Run localVENV.bat (Setup and Test Virtual Environment): Calls `localVENV.bat` (Note: `localVENV.bat` is not included in the current file list. It might be a previous version of `setup_venv.bat` or a similar script. *Clarify if this script is still relevant or should be replaced with `setup_venv.bat` in the menu.*)
        2.  Run local_python.bat (Interactive Python Shell): Calls `local_python.bat`.
        3.  Exit: Exits `py_menu.bat`.
    *   **Note:**  The functionality of `py_menu.bat` largely overlaps with options already available in the main `menu.bat` (especially within the Python Menu and Setup Menu). Consider whether to integrate the useful options from `py_menu.bat` into `menu.bat` and remove `py_menu.bat` to simplify the project and avoid having multiple menu entry points.

7.  **`setup_venv.bat` - Virtual Environment Setup Script**

    *   **Purpose:**  Creates or verifies the Python virtual environment (`venv/`) for the project. This script ensures that a clean and isolated Python environment is set up with the correct Python version (Python 3.12.X as specified in the script).
    *   **Usage:** Run `setup_venv.bat` directly or select the "Install VENV" option from the Setup Menu in `menu.bat`.
    *   **Actions:**
        *   Checks if the `venv/` directory already exists.
        *   If `venv/` does not exist:
            *   Prompts the user to confirm venv installation.
            *   Creates the virtual environment using `python -m venv venv` (using Python 3.12.X specifically).
        *   In either case (venv exists or is created):
            *   Activates the virtual environment.
            *   Runs basic checks to verify Python is working correctly within the venv (prints a message and checks Python version).
            *   Deactivates the virtual environment.
        *   Includes error handling and informative messages throughout the process.

## Getting Started

1.  **Ensure Python 3.12.x is Installed:**  Verify that you have Python version 3.12.x installed on your system. The scripts are configured to use this specific version.
2.  **Download or Create the Directory Structure:** Create the `MyProjectTools/` directory and the `autovenv/` subdirectory within it. Place all the `.bat` scripts and `requirements.txt` file inside the `autovenv/` directory. Create `main.bat` in the `MyProjectTools/` directory.
3.  **Run `main.bat`:** Navigate to the `MyProjectTools/` directory in your command prompt and run `main.bat`.
4.  **Setup Virtual Environment:** From the Main Menu, go to "Setup" (option 2) and choose "Install VENV" (option 1) to create the Python virtual environment.
5.  **Install Dependencies:**  From the Main Menu, go to "Python menu" (option 3) and choose "Install requirements.txt file (locally)" (option 4) to install the necessary Python packages (PyWebView, etc.) into your virtual environment.
6.  **Run PyWebView Viewports:** You can now use options in the Main Menu (option 1 "Quick Launch PyWebViewViewport") or other menus to run PyWebView applications and utilities.

This documentation should help you understand the purpose and organization of the PyWebView launcher batch scripts. Remember to consult the comments within each script file for more detailed information about specific commands and logic.