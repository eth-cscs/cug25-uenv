# CUG25 paper on uenv and CPE-free HPE Cray EX

[**Call for papers**](https://cug.org/cug-2025-call-for-papers/)

The *submission category* is **Applications, Analytics and Environments**, which covers "Programming Environment, Compilers, Libraries, Tools".

## CUG23 paper

This work we first presented at CUG23 "Deploying Alternative User Environments on Alps", which had three key sections:

1. **Spack Stacks**: Introduced the stackinator tool, and detailed description of the uenv image building process.
    * this section was the main focus of the paper
2. **Deployment**:
    * `squashfs-mount` was the only tool discussed for CLI interaction
    * The SLURM plugin was introduced (early version that mounted the image `ntasks-per-node` times on each node
    * CI/CD pipeline was briefly discussed and described as "in development"
3. **Results and Performance**:
    * build time of squashfs images - using build caches and in memory filesystems;
    * effect on compilation time for developers - squashfs vs. Lustre;
    * application benchmarks - verify that squashfs with cray-mpich is no slower than 

## Thesis

* gitops deployment of user environments/applications/programming environments
    * "environment-as-code"
    * each environment is an artifact that is not replaced by new versions
    * manage all descriptions through git and pipelines
    * **aim** all uenvs are defined as recipes in a GitHub repository
    * **aim** a CI/CD pipeline builds and deploys uenv images using triggers on the GitHub repository
    * **aim** each build generates an artifcat
    * **aim** images can be rebuilt using the meta data
* decouple environments
    * update and upgrade environments independently of one another
    * meet the twin aims of:
        * long term stability
        * providing the latest software (MPI, CUDA, NCCL, libfabric, etc) as soon as it is released
    * achieved through:
        * reducing system dependencies
        * each environment is an artifact
    * **aim**: existing uenv and workflows based on them are unaffected by releasing new versions of the uenv
    * **aim**: existing uenv are not broken by updates to the underlying system - and if a major upgrade does break them, they can be rebuilt.
    * **aim**: uenv that provide the latest versions of software (including pre-releases of cray-mpich, the latest cuda) can be deployed as soon
* the team responsible for supporting software environments should have full responsibility for its deployment
    * to create and deploy software should not require root privelages, and should not require any modification to the system itself.
    * no update to OS images, no reboot or system administrator / system engineer involvement
    * **aim**: staff who support applications and PE should have end to end responsibility
    * **aim**: user communities can take control of software deployments using the same tools (MCH, EXCLAIM, ESIWAG CI/CD pipelines)
    * **aim**: individual users can build and share their own uenv images


## Topics

GitOps:
* uenv recipes stored in github
* pipeline definition in github
* pipelines triggered via github webhooks
* uenv tools (CLI, slurm plugin) are developed in GitHub
* uenv tools are built on CSCS systems and RPMs are created
* uenv vservice is git repository - versioned deployments
* vCluster definitions are teraform - use versioned vservice

User land deployment:
* uenv rely on libfabric, xpmem and cuda driver only (root access to install those)
    * libfabric and xpmem could be moved inside the uenv - at the cost of reduced durability of uenv images
* uenv can be built
    * cscs staff can deploy via ci/cd
    * cscs communities can configure their own pipeline with CSCS
    * cscs users can deploy via 

uenv2:
* rewrite of the first set of tools to consolidate the slurm plugin in a single repository
    * common C++ library used by both sets of tools
    * site-specific in a separate module to allow for integration at other sites

uenv build:
* users have familiar interface

## Structure

Approach 1:
* introduction describes the aims and motivation
* organise the paper around the developments (uenv2, OCI registry, CI/CD, build-service, repositories) and 
* point out how each development addresses the aims.

Approach 2:
* introduction describes the aims and motivation
* organise the paper around the high level objectives (user land everything, gitops, )
* point out how each development addresses the aims.
