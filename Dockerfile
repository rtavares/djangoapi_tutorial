FROM python:3.7-alpine
WORKDIR projectdir

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

RUN apk update && apk add postgresql-dev \
                      gcc \
                      python3-dev \
                      musl-dev \
                      postgresql-client

RUN pip install pipenv
COPY Pipfile Pipfile.lock ./

RUN pipenv install --system

COPY . ./