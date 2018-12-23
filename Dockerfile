FROM python:3.6.6-slim-stretch

WORKDIR /app

RUN mkdir -p /usr/share/man/man1 && \
  apt-get update && \
  apt-get -y --no-install-recommends install openjdk-8-jdk-headless

COPY Pipfile /app
COPY Pipfile.lock /app
RUN pip install pipenv
RUN pipenv install -d --system --deploy --ignore-pipfile

COPY . /app

EXPOSE 3000

# Make port 80 available to the world outside this container
EXPOSE 80

# Set flask app path
ENV FLASK_APP=src/main/python/web/app.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
