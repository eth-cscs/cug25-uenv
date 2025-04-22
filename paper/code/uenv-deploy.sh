# deploy from the build namespace
uenv image copy --token=$HOME/.ssh/jfrog-token \
                build::icon/25.2:1656679281 \
                deploy::icon/25.2:v2@daint
# deploy the image to a different cluster
uenv image copy --token=$HOME/.ssh/jfrog-token \
                deploy::icon/25.2:v2@daint \
                deploy::icon/25.2:v2@santis
