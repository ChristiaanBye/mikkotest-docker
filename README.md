# mikkotest-docker
This repository provides a Docker configuration so you can run the CLI tool without having to setup (barely) anything yourself!

## Prerequisites
Before getting started, I assume you have cloned the following repository:

* [mikkotest](https://github.com/ChristiaanBye/mikkotest)

If not, please do so as the code present in this repository will be mounted as a volume within the Docker container.

## Installation
1. Clone this repository

1. Build the container
    ```sh
    docker-compose build
    ```

1. Start the container
    ```sh
    docker-compose up
    ```

## Connecting via SSH
In order to run the CLI tool, you likely will want to connect to the container using SSH. You can do so by using the following command:
```sh
ssh mikko@127.0.0.1 -p 1337
```
You may then input `test1234` when prompted for a password.
