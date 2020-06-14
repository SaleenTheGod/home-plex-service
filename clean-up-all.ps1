$sonarCfg = "sonarr-docker-compose-config.yml"
$radarrCfg = "radarr-docker-compose-config.yml"
$jackettCfg = "jackett-docker-compose-config.yml"

docker-compose -f $sonarCfg down
docker-compose -f $radarrCfg down
docker-compose -f $jackettCfg down

if (Test-Path -Path jackket/)
{
     Remove-Item -Recurse jackket/
}
if (Test-Path -Path sonarr/)
{
     Remove-Item -Recurse sonarr/
}
if (Test-Path -Path radarr/)
{
     Remove-Item -Recurse radarr/
}