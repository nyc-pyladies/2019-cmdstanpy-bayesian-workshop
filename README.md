# Welcome to Bayesian Workflows using CmdStanPy!

## We will be predicting the results of Women's World Cup 2019!


####  Today's tutorial and dependencies will be provided in [Google Colab](https://colab.research.google.com/)

This requires a Google account, allowing you to save a copy of the notebook to your personal Google Drive.

#### However, if you prefer to work locally on your machine, here are steps to install CmdStanPy and tutorial requirements:
1. Navigate to a desired directory
2. `git clone git@github.com:nyc-pyladies/2019-cmdstanpy-bayesian-workshop.git`
3. `cd 2019-cmdstanpy-bayesian-workshop/`
4. `python3 -m venv venv`
5. `source venv/bin/activate`
6. `pip install -r requirements.txt`

#### In order to use CmdStanPy, we need to install the shell interface to Stan using [CmdStan](https://mc-stan.org/users/interfaces/cmdstan)

CmdStanPy provides a script to perform this install:

5. Save a copy of this python script to your machine:
 [install_cmdstan.py](https://github.com/stan-dev/cmdstanpy/blob/master/bin/install_cmdstan)
6. Run the file: `python install_cmdstan.py`

	*(This may take a few minutes)*

	Take note of the install directory, as well as the install version. You should see the following logged in the first couple of lines from installation:

*Install directory: /Users/(your username)/.cmdstanpy*

*Downloading CmdStan version 2.20.0*

7. Set environment variable for `CMDSTAN`

`export CMDSTAN='/Users/(your username)/.cmdstanpy/cmdstan-2.20.0'`

*(The path and cmdstan version should match the log output from Step 6)*

8. Run `jupyter notebook`
