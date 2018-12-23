# New

## 1. Installation

Install dependencies with pipenv:

    pipenv install -d

If pipenv can not be found, install pipenv using pip.

## 2. Development

Print a list of available commands:

    make help

Before running any command, clean the project with `make clean` just in case.

## 3. Work In Progress

This repository demonstrates a workflow that allows you to:
- develop and run code within a docker container
- implement CI to run tests within the same docker container
- implement CD pipeline to build and deploy production docker containers that were built within the development docker container

So far...

- `bash new` allows you to build a new project
- the makefile commands are printed out, allowing you to:
  - run pytests
  - build the project locally
  - build and run a dev docker image
  - build and run a dev docker stack
- tests run from vscode
- spark example

Todo

- run any type of application using a script, without having to change docker image
- ci-cd: build docker container
- test modules are currently imported relative from the root
