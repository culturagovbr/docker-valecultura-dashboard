#!/bin/bash
set -e
echo "[ ****************** ] Starting Endpoint of Application"
if ! [ -e "/var/www/valecultura-dashboard/index" ] ; then
    echo "Application not found in /var/www/valecultura-dashboard - cloning now..."
    if [ "$(ls -A)" ]; then
        echo "WARNING: /var/www/valecultura-dashboard is not empty - press Ctrl+C now if this is an error!"
        ( set -x; ls -A; sleep 10 )
    fi
    echo "[ ****************** ] Cloning Project repository to tmp folder"
    git clone -b http://git.cultura.gov.br/95274316115/valecultura-dashboard.git
    ls -la /tmp/valecultura-dashboard

    echo "[ ****************** ] Copying Project from temporary folder to workdir"
    cp /tmp/valecultura-dashboard -r /var/www

    echo "[ ****************** ] Changing owner and group from the Project to 'www-data' "
    chown www-data:www-data -R /var/www/valecultura-dashboard

    ls -la /var/www/valecultura-dashboard

    echo "Complete! The application has been successfully copied to /var/www/valecultura-dashboard"
fi
echo "[ ****************** ] Ending Endpoint of Application"
exec "$@"