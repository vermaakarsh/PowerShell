foreach ($line in $(docker ps -a) ) {

    $line -match "^\w{12}"
    $container = docker inspect $Matches.Values | ConvertFrom-Json

    if ( $container.id ) 
    
    {
        echo $container.config.Image
        docker stop $Matches.Values -t 0
        docker rm $Matches.Values
    }
}

Read-Host -Prompt "Press Enter to exit" 