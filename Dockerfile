# Use alpine because its super light weight
FROM alpine:latest

# Copy files from the action repository to the filesystem path `/` of the container
COPY . ${GITHUB_WORKSPACE}
COPY entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache docker
RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
