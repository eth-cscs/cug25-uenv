[](){#ref-tutorial}
# Tutorial: uenv and CPE Containers on Alps

This tutorial offers a hands-on experience with building and managing software on an HPE Cray system that does not have the CPE installed. 

Specifically, you will be using uenv and a containerized CPE. 

You will be given access to NVIDIA Grace Hopper nodes on Alps -- an HPE Cray Supercomputing EX system at CSCS.

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

You have 50 GB available in your `$HOME` directory (`/users/<cscsusername>`). We recommend building your software and running your applications from your `$SCRATCH` directory (`/capstor/scratch/<cscsusername>`), which is a Lustre filesystem.



