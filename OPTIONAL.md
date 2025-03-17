# Optional Setup

Optional setup for Python projects.


## Automatically Activate `venv` (bash-like shells)

If you want to automatically activate the `venv` when opening your local version of the project, execute the `autoenv.sh` script from project root:

```bash
source scripts/autoenv.sh
```

The `autoenv.sh` script appends this code block to your `.bashrc` file (if it doesn't already exist in `.bashrc`):

```bash
if ! grep -q "source venv/Scripts/activate" "$target"; then
    echo "$code_block" >> "$target"
    echo "Auto env code added to '.bashrc'."
else
    echo "Auto env code exists in '.bashrc'. Aborting command."
fi
```

The code block checks the working directory for a `venv` directory, and if it exists, activates the `venv`.

Restart the terminal. The `venv` should automatically be activated whenever you open a new terminal session in the project root directory.


## Activate Jupyter Kernel for a `venv`

Optionally create a kernel to use the `venv` in Jupyter.

Execute the following commands in a terminal from project root:

```bash
source venv/Scripts/activate
python -m ipykernel install --user --name=turtles-env --display-name "Python (turtles-env)"
```

You should now have the option to select the new kernel when running a Jupyter notebook.
