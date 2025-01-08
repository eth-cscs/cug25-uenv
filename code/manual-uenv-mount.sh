sudo mount --type=squashfs --source=$SQFS \
    --options=loop,nosuid,nodev,ro \
    --target=/opt/cscs/tools
