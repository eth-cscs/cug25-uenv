# configure a build using cmake, then build in a separate call
uenv run --view=default prgenv-gnu/24.11:v1 -- \
    cmake -DUSE_GPU=cuda -DUSE_MPI=on ..
uenv run --view=default prgenv-gnu/24.11:v1 -- \
    make -j64

# use a scientific application provided by a uenv...
# then run a visualisation script using another uenv
uenv run --view=gromacs gromacs/2024:v1 -- gmx_mpi
uenv run --view=default paraview/2024:v1 -- \
    ./post-process.sh
