repo=jfrog.svc.cscs.ch/uenv
outpath_path=build/clariden/gh200/prgenv-gnu/24.11:1716820670
# push the squashfs image to the container registry
oras push $repo/$output_path \
    --artifact-type application/x-squashfs \
    store.squashfs
# attach the metadat image to the image
oras attach $repo/$output_path \
    --artifact-type uenv/meta \
    ./meta
