# make a squashfs image of the venv
mksquashfs $SCRATCH/sqfs-demo/.venv \
    py_venv.squashfs -no-recovery -noappend
# start the uenv with the venv mounted
cd $SCRATCH/env
uenv start --view=default \
    prgenv-gnu/24.11:v1,$PWD/py_venv.squashfs:$SCRATCH/env/.venv
source .venv/bin/activate
