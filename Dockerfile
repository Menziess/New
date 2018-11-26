FROM python:3.6.6-slim-stretch

WORKDIR /app

COPY Pipfile /app
COPY Pipfile.lock /app
RUN pip install pipenv
RUN pipenv install -d --system --deploy --ignore-pipfile

COPY . /app

EXPOSE 3000

ENTRYPOINT [ "/bin/sh", "-c" ]
