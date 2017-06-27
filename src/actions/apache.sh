
echo "[******] Copying and enable virtualhost 'site.conf'";
cp /tmp/src/actions/apache2/sites-available/site.conf /etc/apache2/sites-available/site.conf

echo "[******] Copying configurations for security of apache.";
cp /tmp/src/actions/apache2/conf-available/security.conf /etc/apache2/conf-available/security.conf

echo "[******] Copying configurations for security of apache.";
cp /tmp/src/actions/apache2/ports.conf /etc/apache2/ports.conf

a2ensite site.conf

echo "[******] Disable default virtualhost '000-default.conf'";
a2dissite 000-default.conf

echo "[******] Restarting Apache 2 Service";
service apache2 reload

echo "[******] Starts Apache using Foreground Mode";
apache2ctl -D FOREGROUND
