FROM alpine:edge

# We need git to pip install directly from a git repository.
# We need openssh-client to git clone via SSH
# (it's more secure to use a deploy key than a password).
RUN apk add --no-cache python3-dev py3-pip git openssh-client \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && python -m pip install --no-cache-dir --upgrade pip certifi

