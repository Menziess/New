FROM python:latest

WORKDIR /app

COPY Pipfile /app
COPY Pipfile.lock /app

RUN pip install pipenv
RUN pipenv install -d --system

COPY . /app

EXPOSE 3000

CMD ["python","-u","src/main.py"]
