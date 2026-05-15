# UV Managed Python Automation Scripts

A collection of Windows Batch scripts designed to streamline the installation of the **uv** package manager, manage Python environments, and run scripts with automatic dependency syncing.

---

## 🚀 Quick Start Guide

### 1. Installation

* **`00_managed_python_setup_uv.bat`**: Installs the `uv` package manager via PowerShell.
* **`01_managed_python_setup_py.bat`**: Uses `uv` to install the latest Python version.
> **Note:** Both scripts require a safety confirmation code (**951**) to prevent accidental execution.



### 2. Environment Management

* **`02_managed_python_open_venv.bat`**: Simply activates the `.venv` in a new command prompt.
* **`02_managed_python_check_packages_open_venv.bat`**: Lists all installed packages using `uv pip list` before opening the virtual environment.

### 3. Running Scripts

These scripts search for `.py` files in the current directory. If a single file is detected it is run directly. If multiple files exist, you can choose one; if no files are found, a file picker will open.

* **Standard Mode**: (Checks venv and syncs `requirements.txt` first)
* `03_managed_python_run_only.bat`: Runs the script and exits.
* `03_managed_python_run_then_interact.bat`: Runs the script and keeps the Python REPL open (`-i`).


* **Fast Mode**: (Skips environment checks for quicker execution)
* `04_managed_python_run_only_fast.bat`
* `04_managed_python_run_then_interact_fast.bat`



### 4. Cleanup

* **`99_managed_python_UNINSTALL_uv_and_py.bat`**: Completely removes `uv` binaries, cached Python versions, and app data. (Requires confirmation code **951**).

---

## 🛠 Features

| Feature | Description |
| --- | --- |
| **Automatic Venv** | Scripts automatically create a `.venv` if one is missing. |
| **Dependency Sync** | Automatically runs `uv pip sync` if a `requirements.txt` is detected. |
| **Logging** | Setup and execution details are logged to `activity_*.log` files. |
| **Smart Picker** | Automatically detects your script or opens a Windows file dialog if the folder is empty. |
| **Safety First** | Destructive actions or global installs require a specific PIN entry. |

---

## Requirements

* **Operating System**: Windows Machines 
* **Internet Connection**: Required for the initial `uv` and Python installation.

## Usage Notes

* **Confirmation Code**: When prompted, type `951` to proceed with installations or uninstalls.
* **Exit**: For script runners, enter `8` when finished to close the window.
* **Manual Step**: After uninstalling, kindly manually remove the `.local/bin` entry from your System PATH environment variable. This step is risky to automate therefore left for user to manually perform carefully.
