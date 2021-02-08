ARG DOCKER_BASE_IMAGE_PREFIX
ARG DOCKER_BASE_IMAGE_NAMESPACE=pythonpackagesonalpine
ARG DOCKER_BASE_IMAGE_NAME=basic-python-packages-pre-installed-on-alpine
FROM ${DOCKER_BASE_IMAGE_PREFIX}${DOCKER_BASE_IMAGE_NAMESPACE}/${DOCKER_BASE_IMAGE_NAME}:pip-alpine

RUN python -m pip install --no-cache-dir tox \
    && python -m pip install --no-cache-dir coverage docutils flake8 readme-renderer pygments isort setuptools-scm sphinx sphinx-rtd-theme pytest pytest-cov
# Adding all the dependencies of the various toxenvs in the cookiecutter adds 30MB but presumably we'll always want them.

