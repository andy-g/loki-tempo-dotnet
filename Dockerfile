FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine AS dev
WORKDIR /src/
# RUN apk --no-cache add curl procps
# RUN curl -sSL https://aka.ms/getvsdbgsh | sh /dev/stdin -v latest -l /vsdbg
ENTRYPOINT ["dotnet", "watch", "run"]

FROM dev AS publish
COPY . /src/
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS runtime
# EXPOSE 80
WORKDIR /app
COPY --from=publish /src/out ./
ENTRYPOINT ["dotnet", "loki-tempo-dotnet.dll"]