---
theme: ./slidev-theme-cscs
---

# CPE Containers at CSCS

Ben Cumming and Andras Fink

CUG 2025 PEAD BoF

---

# CSCS does not deploy CPE

use containers instead for reasons

* upgrade independently of system upgrades
* installation can done by non-admin
* roll back/roll forward

---

# Step 1: HPE RPM registry

---

# Step 2: Create a Dockerfile

* One per PrgEnv
* pre-load modules

---

# Step 3: Build with CI/CD

* build in k8s
* ReFrame tests

---

# Step 4: Deploy to system

Download and store the images in a centrally managed location

```
srun --environment=cray-cpe/25.3 --pty bash
```

