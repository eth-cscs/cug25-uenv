uenv start prgenv-gnu/24.11:v1 --view=default
# create a working path on SCRATCH
mkdir $SCRATCH/env
cd $SCRATCH/env
# create and activate the empty venv
python -m venv ./.venv
source ./.venv/bin/activate
# install software in the virtual environment
pip install torch torchvision torchaudio \
    --index-url \
    https://download.pytorch.org/whl/cu126
