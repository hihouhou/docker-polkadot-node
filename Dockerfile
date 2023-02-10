#
# Polkadot fast node Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV POLKADOT_VERSION v0.9.37

# Install required packages
RUN apt-get update && apt-get install -y curl gnupg

RUN groupadd -r polkadot && useradd -u 1000 -ms /bin/bash -g polkadot polkadot

# Install the Polkadot binary
RUN curl -sL https://github.com/paritytech/polkadot/releases/download/${POLKADOT_VERSION}/polkadot -o /usr/local/bin/polkadot && \
    chmod +x /usr/local/bin/polkadot

# Expose the port used by the Polkadot node
EXPOSE 9944

USER polkadot

# Start the Polkadot node in observer mode
CMD ["/usr/local/bin/polkadot", "--name", "hihouhou", "--sync", "fast"]
