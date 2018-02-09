#!/bin/bash

if [ ! -f "/opt/jenkins/init.groovy.d/plugins.txt" ];
    then
        cp -r /opt/init.groovy.d /opt/jenkins/
fi

echo "--- Starting jenkins"
chown -R jenkins:jenkins /opt/jenkins/
su jenkins -c '/usr/bin/java \
               -Djenkins.install.runSetupWizard=false \
               -Dhudson.model.DirectoryBrowserSupport.CSP="" \
               -Xmx512m \
               -jar /opt/jenkins.war'
