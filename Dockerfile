ARG JAVA_PACKAGE
ARG PAPER_VERSION
ARG PAPER_BUILD

# Install Alpine 3
FROM alpine:3

# Install Java
RUN apk add --no-cache $JAVA_PACKAGE

# Download PaperMC
ADD https://api.papermc.io/v2/projects/paper/versions/$PAPER_VERSION/builds/$PAPER_BUILD/downloads/paper-$PAPER_VERSION-$PAPER_BUILD.jar /app/paper.jar

# Working directory
WORKDIR /mount

# Startup command
CMD ['java', '-jar', '-Xmx$PAPER_MEMORY', '/app/paper.jar']
