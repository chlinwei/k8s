kubectl create secret \
        docker-registry login-registry-secret \
        --docker-server=lw.registry.com \
        --docker-username=lw \
        --docker-password=linwei \
        -n default
