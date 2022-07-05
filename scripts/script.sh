#!/bin/bash
#delete old files

ls -l /var/lib/jenkins/workspace/Pipeline_with_SCM
mkdir raja
sudo -s find /var/lib/jenkins/workspace/Pipeline_with_SCM -type f -name '*.log' -mmin +60 -delete | sort
ls -l /var/lib/jenkins/workspace/Pipeline_with_SCM