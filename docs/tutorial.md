[](){#ref-tutorial}
# Tutorial: uenv and CPE Containers on Alps

This tutorial offers a hands-on experience with building and managing software on an HPE Cray system that does not have the CPE installed.

Specifically, you will be using uenv and a containerized CPE.

You will be given access to NVIDIA Grace Hopper nodes on Alps -- an HPE Cray Supercomputing EX system at CSCS.

## Schedule

| | |
|---|---|
| 8:30  | Introduction to uenv and Alps |
| 9:00  | Logging in to Alps            |
| 9:15  | Hands on      |
| 10:00 | Coffee Break  |
| 10:30 | Hands on      |
| 11:55 | Wrap up       |
| 12:00 | Lunch         |


## Preparation

The aim of the tutorial is for attendees to get "hands on" time with uenv and Grace-Hopper.

!!! tip "BYO test"
    The best way to do this is by working with an application that you are familiar with.

    Attendees are encouraged to bring a use case that you would like to build and run using uenv.

    * if you don't have an application, we can team you up with somebody who has a use case that interests you
    * use cases can be applications, benchmarks, workflows or building your own uenv.

!!! note "give us a heads up"
    Let us know beforehand about your code and workflow, so that we can prepare.

    * on the [CUG slack](https://crayusers.slack.com)
    * email Ben Cumming: `bcumming@cscs.ch`

## Accessing CSCS

### Logging In

We will use the Daint cluster on Alps (`daint.alps.cscs.ch`) for this tutorial. Login to Daint is via SSH through the front-end server Ela (`ela.cscs.ch`). 

```bash
# login to the frontend ela
ssh -A ela.cscs.ch -l <cscsusername>
<enter password>

# login to daint.alps
ssh daint.alps
<enter password>
```

!!! note ""
    :exclamation: Replace `<cscsusername>` with the username provided to you by CSCS staff.

### System Architecture

All nodes have 4 NVIDIA Grace Hopper Superchips, connected by NVLink. Login and compute nodes are equivalent, so cross-compilation is unnecessary. 

The Grace Hopper Superchip (GH200) has: 

- 72 Neoverse V2 Armv9 cores (aarch64) with 128 GB LPDDR memory
- H100 GPU with 96 GB HBM3 memory
- 900 GB/s NVLink-C2C interface for CPU+GPU coherent memory  

Each node has approximately 800 GB of total memory, accessible from all sockets. 

### Running Jobs

Daint uses Slurm as the workload manager. Slurm is configured to allocate in full nodes: there is no sharing of nodes. 

We have created an advanced reservation for this tutorial named "cug". You should submit jobs to Slurm using `--reservation=cug`. 

Make sure that you can run a simple job through Slurm: 

```bash
srun -n 1 --reservation=cug hostname
```

There are a total of 60 nodes available in the reservation. Please do not occupy multiple nodes for a significant period of time.  

### Filesystems

You have 50 GB available in your `$HOME` directory (`/users/<cscsusername>`).
We recommend building your software and running your applications from your `$SCRATCH` directory (`/capstor/scratch/<cscsusername>`), which is a Lustre filesystem.

## Using uenv

Please refer to the CSCS [uenv documentation](https://eth-cscs.github.io/cscs-docs/software/uenv/) for a reference on all of the uenv commands.

To get started, we suggest using the [`prgenv-gnu`](https://eth-cscs.github.io/cscs-docs/software/prgenv/prgenv-gnu/#prgenv-gnu) uenv, which provides cray-mpich, cmake, Python, gcc, cuda, hdf5, netcdf-[c,fortran,c++] and other useful tools:

```bash
$ uenv image pull prgenv-gnu/24.11:v2
$ uenv start prgenv-gnu/24.11 --view=default
# the default view configures PATH and friends:
$ mpicc --version
$ cmake --version
$ echo $CUDA_HOME
```

uenv that provide programming environments, applications and torch are available:

* [programming environments](https://eth-cscs.github.io/cscs-docs/software/prgenv);
* [applications](https://eth-cscs.github.io/cscs-docs/software/sciapps/);
* [ML software](https://eth-cscs.github.io/cscs-docs/software/ml/);

## Using CPE

Please refer to the CSCS [CPE documentation](https://eth-cscs.github.io/cscs-docs/software/prgenv/cpe).

!!! warning
    As a temporary workaround for a Lustre bug, the following environment variable must be set:
    ```terminal
    $ export EDF_PATH=/capstor/scratch/cscs/anfink/shared/cpe/edf:$EDF_PATH
    ```

To start testing `PrgEnv-gnu`, allocate an interactive session:
```console
$ srun -n 1 --reservation=cug --environment=cpe-cray-24.07 --pty bash
$ module list
$ module avail
```
