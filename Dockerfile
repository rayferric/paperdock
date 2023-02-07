# Install Alpine 3

FROM alpine:3

# Install Java

ARG JAVA_PACKAGE

RUN apk add --no-cache $JAVA_PACKAGE

# Download PaperMC

ARG PAPER_VERSION
ARG PAPER_BUILD

ADD https://api.papermc.io/v2/projects/paper/versions/$PAPER_VERSION/builds/$PAPER_BUILD/downloads/paper-$PAPER_VERSION-$PAPER_BUILD.jar /app/paper.jar

# Add the user and let it access the .jar
# Changing the user is necessary to normalize the permissions of volumes

ARG USER
#RUN adduser --disabled-password $USER
RUN chown $USER /app/paper.jar
USER $USER

# Set the working directory
WORKDIR /mount

# Startup command
CMD ["sh", "-c", "java -jar -Xmx$PAPER_MEMORY -Dcom.mojang.eula.agree=true /app/paper.jar nogui"]

