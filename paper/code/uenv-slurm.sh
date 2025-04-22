#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-task=1
#SBATCH --uenv=prgenv-gnu/24.11
# this view adds all software to PATH
#SBATCH --view=default

# use sqlite3 provided by prgenv-gnu
query="SELECT config FROM materials LIMIT 1;"
material=$(sqlite3 materials.db "$QUERY")

# run with prgenv-gnu on each compute node
srun ./test-material.sh $material

# use a different uenv to generated images
srun --uenv=paraview/5.13.0:rc1 ./generate-image.sh
