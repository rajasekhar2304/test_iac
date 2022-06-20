#!/bin/bash
#delete old files

ls -l /home/devrabbit/Desktop/DevOps/shell_scripting/test
sudo -s find /home/devrabbit/Desktop/DevOps/shell_scripting/test -type f -name '*.log' -mmin +30 -delete | sort
ls -l /home/devrabbit/Desktop/DevOps/shell_scripting/test