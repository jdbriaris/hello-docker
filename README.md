# hello-docker
The obligatory 'Hello World' program written as a [.NET Core](https://www.microsoft.com/net/core) application to be run as a container using the [Docker](https://www.docker.com/) framework.

## Prerequisites
+ You have installed the [.NET Core SDK](https://www.microsoft.com/net/core#windowscmd) on your development machine.
+ You have installed [Docker](https://www.docker.com/products/overview) on you development machine.

## Running the application
Open a terminal and clone this repository to your development machine

````
git clone https://github.com/jdbriaris/hello-docker/
````

Restore, build and publish the .NET Core application ensuring the build is published to a directory called `out`

````
dotnet restore
dotnet publish -c Release -o out
````

Build the docker image based on the `Dockerfile`

````
docker build -t hello-docker .
````

Run the docker image in a docker container

````
docker run hello-docker
````

If all goes well, you should see the text "Hello Docker!" printed to the console window.
