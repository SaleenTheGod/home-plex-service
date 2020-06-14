###############################################################################################
# Home Automation setup script

# Created By: James Ambrose
# Usage: .\init-automation.ps1
# Brings up a containerized version of Sonarr, Jackett and Radarr for home media automation
###############################################################################################

##### VARS #####

$sonarCfg = "sonarr-docker-compose-config.yml"
$radarrCfg = "radarr-docker-compose-config.yml"
$jackettCfg = "jackett-docker-compose-config.yml"
$dockerComposeURL = "https://docs.docker.com/compose/"

##### Sonarr #####

Write-Host "Attempting to start Sonarr container"
docker-compose -f $sonarCfg up -d --remove-orphans

if (!$?)
{
     Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
     Write-Host "If so please check that $sonarCfg is up to date."
     exit
}
elseif ($?)
{
     Write-Host "Sonarr was successfully brought online. Live at http://$(hostname):8989"
}

##### Radarr #####

Write-Host "Attempting to start Radarr container"
docker-compose -f $radarrCfg up -d --remove-orphans

if (!$?)
{
     Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
     Write-Host "If so please check that $radarrCfg is up to date."
     exit
}
elseif ($?)
{
     Write-Host "Sonarr was successfully brought online. Live at http://$(hostname):7878"
}

##### Jackett #####

Write-Host "Attempting to start Jackett container"
docker-compose -f $jackettCfg up -d --remove-orphans

if (!$?)
{
     Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
     Write-Host "If so please check that $jackettCfg is up to date."
     exit
}
elseif ($?)
{
     Write-Host "Sonarr was successfully brought online. Live at http://$(hostname):9117"
}
