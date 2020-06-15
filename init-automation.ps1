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
$sabnzbdCfg = "sabnzbd-docker-compose-config.yml"
$plexCfg = "plex-docker-compose.config.yml"
$organizrCfg = "organizr-docker-compose-config.yml"
$ombiCfg = "ombi-docker-compose-config.yml"
$dockerComposeURL = "https://docs.docker.com/compose/"

if ($null -eq $args[0])
{
     Write-Warning "Unexpected input! Exptected parameters are: `"start`" & `"cleanup`"" 
     exit
}

if ($args[0].ToLower() -eq "start"){
     ##### Sonarr #####

     Write-Host "Attempting to start Sonarr container"
     docker-compose -f $sonarCfg up -d

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
     docker-compose -f $radarrCfg up -d

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
     docker-compose -f $jackettCfg up -d

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

     ##### sabnzbd #####

     Write-Host "Attempting to start sabnzbd container"
     docker-compose -f $sabnzbdCfg up -d

     if (!$?)
     {
          Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
          Write-Host "If so please check that $sabnzbdCfg is up to date."
          exit
     }
     elseif ($?)
     {
          Write-Host "Sonarr was successfully brought online. Live at http://localhost:8080"
     }

     ##### plex #####

     Write-Host "Attempting to start Plex container"
     docker-compose -f $plexCfg up -d

     if (!$?)
     {
          Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
          Write-Host "If so please check that $plexCfg is up to date."
          exit
     }
     elseif ($?)
     {
          Write-Host "Sonarr was successfully brought online. Live at http://$(hostname):32400"
     }

     ##### Organizr #####

     Write-Host "Attempting to start Organizr container"
     docker-compose -f $organizrCfg up -d

     if (!$?)
     {
          Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
          Write-Host "If so please check that $organizrCfg is up to date."
          exit
     }
     elseif ($?)
     {
          Write-Host "Sonarr was successfully brought online. Live at http://$(hostname):9983"
     }

     ##### Ombi #####

     Write-Host "Attempting to start Ombi container"
     docker-compose -f $ombiCfg up -d

     if (!$?)
     {
          Write-Host "Failed to start Sonarr is docker running with docker-compose installed? $dockerComposeURL"
          Write-Host "If so please check that $ombiCfg is up to date."
          exit
     }
     elseif ($?)
     {
          Write-Host "Sonarr was successfully brought online. Live at http://$(hostname):3579"
     }
}
elseif ($args[0].ToLower() -eq "cleanup")
{
     docker-compose -f $sonarCfg down
     docker-compose -f $radarrCfg down
     docker-compose -f $jackettCfg down
     docker-compose -f $sabnzbdCfg down
     docker-compose -f $plexCfg down
     docker-compose -f $organizrCfg down
     docker-compose -f $ombiCfg down

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
     if (Test-Path -Path sabnzbd/)
     {
          Remove-Item -Recurse sabnzbd/
     }
     if (Test-Path -Path plex/)
     {
          Remove-Item -Recurse plex/
     }
     if (Test-Path -Path organizr/)
     {
          Remove-Item -Recurse organizr/
     }
     if (Test-Path -Path ombi/)
     {
          Remove-Item -Recurse ombi/
     }
}
else 
{
     Write-Host "Unexpected input! Exptected parameters are: `"start`" & `"cleanup`""     
}