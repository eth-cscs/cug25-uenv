# list available uenv named prgenv-gnu
uenv image find prgenv-gnu
# download a uenv image
uenv pull prgenv-gnu/24.11
# start a shell with modules enabled
uenv start prgenv-gnu/24.11 --view=modules
