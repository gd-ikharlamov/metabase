#!/bin/bash

if [ ! -d "/var/jenkins/init.groovy.d/" ];
    echo "--- Copying reference files"
    then
        cp -r /usr/share/jenkins/ref/* /var/jenkins/
fi

echo "--- Starting jenkins"
chown -R jenkins:jenkins /var/jenkins/
su jenkins -c '/usr/bin/java \
               -Djenkins.install.runSetupWizard=false \
               -Dhudson.model.DirectoryBrowserSupport.CSP="" \
               -Xmx512m \
               -jar /usr/share/jenkins/jenkins.war'
