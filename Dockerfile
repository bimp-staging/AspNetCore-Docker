FROM docker.io/microsoft/aspnetcore:2.0.8 AS build
WORKDIR /code
COPY . .
RUN dotnet restore
RUN dotnet publish --output /output --configuration Release

FROM docker.io/microsoft/aspnetcore:2.0.8
COPY --from=build /output /app
WORKDIR /app
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]