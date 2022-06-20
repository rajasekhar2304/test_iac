#!/bin/bash
#delete old files

ls -l /home/devrabbit/Desktop/DevOps/shell_scripting/test
find /home/devrabbit/Desktop/DevOps/shell_scripting/test -type f -name '*.log' -mmin +30 -exec sudo rm -rf {} \;
ls -l /home/devrabbit/Desktop/DevOps/shell_scripting/test