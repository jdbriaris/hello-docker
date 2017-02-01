FROM microsoft/dotnet:1.1-runtime
COPY out .
ENTRYPOINT ["dotnet", "hello-docker.dll"]