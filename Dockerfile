FROM node:22.12.0-alpine

RUN addgroup -S spashipuser && \
    adduser -S spashipuser -G spashipuser && \
    apk add --no-cache gnupg curl

USER spashipuser

RUN curl -o- -L https://yarnpkg.com/install.sh | YARN_VERSION=1.22.22 sh

WORKDIR /app

RUN addgroup -S spashipuser && \
    adduser -S spashipuser -G spashipuser && \
    apk add --no-cache curl

USER spashipuser

# Ensure yarn global bin is in the user's PATH
ENV PATH="/home/spashipuser/.yarn/bin:/home/spashipuser/.config/yarn/global/node_modules/.bin:$PATH"
# Hide node depreciation warnings
ENV NODE_OPTIONS="$NODE_OPTIONS --no-deprecation"

# Install Spaship CLI
ARG SPASHIP_CLI_VERSION=1.8.0

RUN yarn global add @spaship/cli@$SPASHIP_CLI_VERSION

# Set the ENTRYPOINT to spaship command directly
ENTRYPOINT ["spaship"]

# Default command arguments (can be overridden at runtime)
CMD ["--help"]