# FROM python:3.8.12-slim-buster as base
FROM python:3.11.11-bullseye as base

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get -y install postgresql-client

# Install pipenv and compilation dependencies
RUN pip install --upgrade pip
RUN pip install pipenv

RUN apt-get -y install libpango-1.0-0 libpangoft2-1.0-0 libjpeg-dev libopenjp2-7-dev libffi-dev

RUN apt-get -y install fonts-dejavu
#For Nepali font in weasyprint
RUN apt-get -y install fonts-noto fonts-noto-cjk

# Create and switch to a new user
RUN useradd --create-home appuser
USER appuser

WORKDIR /app


COPY Pipfile .
COPY Pipfile.lock .

RUN pipenv install --system --dev

ENV PATH "$PATH:/home/appuser/.local/bin"

COPY . /app