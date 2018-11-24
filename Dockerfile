FROM python:3.6.6-slim-stretch

WORKDIR /app

COPY Pipfile /app
COPY Pipfile.lock /app
# Layer of pipfiles

RUN pip install pipenv
RUN pipenv install -d --system --deploy --ignore-pipfile
# --system flag will install all packages into the system
# --deploy flag will cause build fail if Pipfile.lock is out of date
# --ignore-pipfile so it won't mess with the setup

COPY . /app

EXPOSE 3000
# Expose 3000 for debugging

ENTRYPOINT ["python"]
# Executable

CMD ["-u","src/main/python/app.py"]
# Commands
