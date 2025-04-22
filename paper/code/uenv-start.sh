# now we are in a shell with the uenv loaded
uenv start --view=default prgenv-gnu/24.11:v1

python -m venv .env
source ./.env/bin/activate
pip install torch torchvision --index-url \
    https://download.pytorch.org/whl/cu126

# start a Python repl to test torch
python

# end the session: returns to the calling shell
exit
