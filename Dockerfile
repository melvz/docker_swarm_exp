# use a node base image
FROM node:7-onbuild


# If building behind an http_proxy, set them for npm
RUN npm config set proxy http://10.144.76.10:8080 && \
    npm config set https-proxy http://10.144.76.10:8080


# set maintainer
LABEL maintainer "ninja_rendition"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000
