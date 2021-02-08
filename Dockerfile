ARG DOCKER_BASE_IMAGE_PREFIX
FROM ${DOCKER_BASE_IMAGE_PREFIX}pythonpackagesonalpine/basic-python-packages-pre-installed-on-alpine:pip-alpine

RUN python -m pip install --no-cache-dir tox \
    && python -m pip install --no-cache-dir coverage docutils flake8 readme-renderer pygments isort setuptools-scm sphinx sphinx-rtd-theme pytest pytest-cov
# Adding all the dependencies of the various toxenvs in the cookiecutter adds 30MB but presumably we'll always want them.

