# NuGet restore
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY *.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet build

# publish
FROM build AS publish
WORKDIR /src
RUN dotnet publish -c Release -o /src/publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=publish /src/publish .
#ENTRYPOINT ["dotnet", "iguesnetcoreapi.dll"]
# heroku uses the following
CMD ASPNETCORE_URLS=http://*:$PORT dotnet iguesnetcoreapi.dll