#!/bin/fish

# Task 1
set task_directory "/home/$USER/task_fish_script"
set log_file "$task_directory/fish_script_log.txt"

mkdir -p $task_directory
echo (date) (whoami) (hostname) (uname -r) >> $log_file

# Task 2
set project "os_lab"
set project_directory "/home/$USER/Documents/GitHub/$project"
set archive_file "$task_directory/project_archive.tar.gz"

cd $project_directory
make clean
tar -czf $archive_file .
