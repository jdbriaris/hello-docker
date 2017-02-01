FROM microsoft/dotnet:1.0-runtime
COPY out .
ENTRYPOINT ["dotnet", "hello-docker.dll"]