FROM node:22.12.0-slim

WORKDIR /app

RUN useradd -m spashipuser

USER spashipuser

ARG SPASHIP_CLI_VERSION=1.8.0

RUN curl -o- -L https://yarnpkg.com/install.sh | bash \
    && yarn global add @spaship/cli@$SPASHIP_CLI_VERSION

# Ensure yarn global bin is in the user's PATH
ENV PATH="/home/spashipuser/.yarn/bin:/home/spashipuser/.config/yarn/global/node_modules/.bin:$PATH"

# Set the ENTRYPOINT to spaship command directly
ENTRYPOINT ["spaship"]

# Default command arguments (can be overridden at runtime)
CMD ["--help"]