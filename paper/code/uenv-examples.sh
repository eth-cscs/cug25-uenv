# list available uenv named prgenv-gnu
uenv image find prgenv-gnu
# download a uenv image
uenv pull prgenv-gnu/24.11
# start a shell with modules enabled
uenv start prgenv-gnu/24.11 --view=modules
# run the latest nvim in its own environment
uenv run editors/25.1 --view=ed -- nvim
