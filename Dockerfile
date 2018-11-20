FROM python:latest
WORKDIR /app
COPY . /app
RUN apt update && \
  apt install -y python-pip && \
  pip install -v ptvsd==3.0.0

EXPOSE 3000
CMD python -u hello.py
