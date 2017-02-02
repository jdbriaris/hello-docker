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

[Restore](https://docs.microsoft.com/en-us/dotnet/articles/core/tools/dotnet-restore), [build](https://docs.microsoft.com/en-us/dotnet/articles/core/tools/dotnet-build) and [publish](https://docs.microsoft.com/en-us/dotnet/articles/core/tools/dotnet-publish) the .NET Core application ensuring the build is published to a directory called `out`

````
dotnet restore
dotnet publish -c Release -o out
````

[Build](https://docs.docker.com/engine/reference/commandline/build/) the docker image based on the `Dockerfile`

````
docker build -t hello-docker .
````

[Run](https://docs.docker.com/engine/reference/run/) the docker image in a docker container

````
docker run hello-docker
````

If all goes well, you should see the text "Hello Docker!" printed to the terminal window.

## Using the .NET Core SDK behind a proxy
The .NET Core SDK uses the [NuGet](https://www.nuget.org/) package manager to manage an application's dependencies. If you are working behind a proxy, the initialisation of this package manager may fail when attempting to connect to the NuGet package repository. To overcome this, NuGet must be configured to use your proxy settings:

1. If you do not already know your proxy address, enter `chrome://net-internals/#proxy` into the address bar of a Google Chrome web browser. This should provide you with your proxy address. *N.B. The address may be a link to a script or data file (e.g. &ast;.DAT file). If it is, download it and interrogate it to determine your proxy address*.
2. Add the following proxy cofiguration settings to your global `NuGet.Config` file that is typically loacted at `C:\Users\[user]\AppData\Roaming\NuGet`

    ````xml
    <config>
      <add key="http_proxy" value="http://[your.proxy.address]:[your.proxy.port]" />
      <add key="http_proxy.user" value="[your.user.name]" />
    </config>
    ````

3. If your proxy requires a password, you may also have to add this password to the above NuGet configuration setting

    ````xml
      <add key="http_proxy.password" value="[your.encrypted.password]" />
    ````

More information can be found on the Microsoft site [here](https://docs.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior#proxy-settings) and Stackoverflow [here](http://stackoverflow.com/questions/9232160/nuget-behind-proxy).

