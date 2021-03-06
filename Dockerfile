# Base Image
FROM python:3.8.2
# create and set working directory
RUN mkdir /app
WORKDIR /app

# set default environment variables
ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive 

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    netcat \
    tzdata \
    python3-setuptools \
    python3-pip \
    python3-dev \
    python3-venv \
    git \
    default-libmysqlclient-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install environment dependencies
RUN pip3 install --upgrade pip 
RUN pip3 install pipenv

# copy project
COPY . /app
# Install project dependencies
RUN pipenv install --skip-lock --system --dev

EXPOSE 8000

# Run entrypoint command
ENTRYPOINT [ "/app/entrypoint.sh" ]
