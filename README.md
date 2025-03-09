# GLMs

This project is a simple implementation of various Generalized Linear Models (GLMs) from scratch in Python. The code is packaged as a lightweight Python package named `turtles` ([I like turtles](https://www.youtube.com/watch?v=CMNry4PE93Y)), making the code easy to integrate into your own projects.

The package is written using `numpy` (for linear algebra operations), `scipy` (for some optimization), `pandas` (for tabular operations), and `matplotlib` (for plotting).

The following models have been implemented in this repository:

1. Multiple Linear Regression (`turtles.stats.glms.MLR` class)
2. Logistic Regression (`turtles.stats.glms.LogReg` class, uses `GLM` parent class)
3. Poisson Regression (`turtles.stats.glms.PoissonReg` class, uses `GLM` parent class)

The `GLM` parent class supports three optimization methods for parameter estimation: Momentum-based Gradient Descent for first-order optimization, Newton's Method for second-order optimization, and Limited-memory Broyden–Fletcher–Goldfarb–Shanno (L-BFGS). The user can specify the desired optimization `method` during class instantiation.

Momentum-based Gradient Descent and Newton's Method are implemented in Python as part of the `turtles` distribution. L-BFGS is implemented using `scipy.optimize`, which is written in C. It's a quasi-Newton method that approximates the Hessian (instead of fully computing it, like Newton's Method), so it's quite fast.

See `examples/{class name}_example.ipynb` for simple examples of using each model class and various supporting functions.


**NOTE**: The subsequent sections contain shell commands that assume you're using a bash (or bash-like) shell. Depending on your shell, you may need to tweak the commands before executing.


## Setup

You can simply pip install the repo to start using the package:

```bash
pip install git+https://github.com/adammotzel/glms.git
```


## Contributing

To run (and edit) this project locally, clone the repo and create your virtual environment from project root, which will create a `venv` directory in your project using your global (or local) Python version:

```bash
python -m venv venv
```

Or, if you want to specify the version (this particular example works on Windows OS):

```bash
py -3.12 -m venv venv
```

Activate the env:

```bash
source venv/Scripts/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```
**NOTE**: `requirements.txt` contains the "dev" dependencies, some of which are not part of the packaged distribution. It also includes the `turtles` package in editable mode (represented by the `-e .` line in the requirements file).

See the `pyproject.toml` file for true package dependencies.


### Adding GLMs

To add more GLM classes, use the `GLM` parent class for inheritence (see `PoissonReg` and `LogReg` as examples). The GLM parent class provides a solid framework for implementing new child classes and should be used whenever possible. Unimplemented GLMs include Negative Binomial, Gamma, and Tweedie.


### OPTIONAL - Automatically activate `venv`

If you want to automatically activate the `venv` when opening your local version of the project, execute the `autoenv.sh` script from project root:

```bash
source autoenv.sh
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

Restart the terminal. The `venv` should automatically be activated whenever you open the terminal in the project root directory (ONLY when using a bash shell).

**NOTE**: setting up "auto env" is completely optional. If you don't want to use this feature (or don't want to modify `.bashrc`), don't execute `autoenv.sh`.


### OPTIONAL - Activate Jupyter kernel for the `venv`

Optionally create a kernel to use the `venv` in Jupyter.

Execute the following commands in a terminal from project root:

```bash
source venv/Scripts/activate
python -m ipykernel install --user --name=turtles-env --display-name "Python (turtles-env)"
```
You should now have the option to select the new kernel when running a Jupyter notebook.


## Testing

All tests are contained within `tests` directories for each module. You can simply execute the `pytest` command in a terminal from project root to run all unit tests.
