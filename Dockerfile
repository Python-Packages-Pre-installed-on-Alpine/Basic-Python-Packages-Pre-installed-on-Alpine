FROM alpine:edge

ARG ETC_ENVIRONMENT_LOCATION

# Depending on the base image used, we might lack wget/curl/etc to fetch ETC_ENVIRONMENT_LOCATION.
ADD $ETC_ENVIRONMENT_LOCATION .

# We need git to pip install directly from a git repository.
# We need openssh-client to git clone via SSH
# (it's more secure to use a deploy key than a password).
RUN set -o allexport \
    && . ./set_variables_in_CI.sh \
    && set +o allexport \
    && sed -i -e 's/https/http/' /etc/apk/repositories \
    && apk add --no-cache python3-dev py3-pip py3-wheel git openssh-client \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && python -m pip install --no-cache-dir --upgrade pip certifi

