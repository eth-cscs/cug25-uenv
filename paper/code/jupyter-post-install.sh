export PATH=/user-tools/env/jupyter/bin:$PATH
pip install --no-cache jupyterhub==4.1.5 \
    pyfirecrest==2.1.0 SQLAlchemy==1.4.52 \
    oauthenticator==16.0.7 jupyterlab==4.1.8
git clone https://github.com/eth-cscs/firecrestspawner.git
cd firecrestspawner
pip install .
