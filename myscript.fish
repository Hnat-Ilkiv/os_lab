#!/bin/fish

# Task 1
set task_directory "/home/$USER/task_fish_script"
set log_file "$task_directory/fish_script_log.txt"

mkdir -p $task_directory
echo "Data: " (date) >> $log_file
echo "Who am I: " (whoami) >> $log_file
echo "Hostname: " (hostname) >> $log_file
echo "Kornal: " (uname -r) >> $log_file
echo  >> $log_file

# Task 2
set project_directory "/home/$USER/Documents/GitHub/os_lab"
set archive_file "$task_directory/project_archive.tar.gz"

cd $project_directory
make clean
tar -czf $archive_file .

echo "Size of archive: " (stat -c "%s" $archive_file) >> $log_file
echo "Largest file: " (find . -type f -not -path './.git/*' -exec stat -c "%s %n" {} + | sort -rh | awk '{gsub(".*/", "", $2); print $2, $1}' | head -n 1) >> $log_file
echo "Smallest file: " (find . -type f -not -path './.git/*' -exec stat -c "%s %n" {} + | sort -rh | awk '{gsub(".*/", "", $2); print $2, $1}' | tail -n 1) >> $log_file

# Task 3
#ls -l ~
echo "ls standart: " (ls -l $task_directory) >> $log_file
chmod -R 700 $task_directory
echo "ls 700: "(ls -l $task_directory) >> $log_file
chmod -R g+r $task_directory
echo "ls g+r: " (ls -l $task_directory) >> $log_file
chmod -R o+rx $task_directory
echo "ls o+rx: " (ls -l $task_directory) >> $log_file
chmod -R 755 $task_directory
echo "ls 755: " (ls -l $task_directory) >> $log_file

# Task 4

function view_contents
	echo "Contents of $project_directory:"

	set choices (ls -1 $project_directory)

	for i in (seq (count $choices))
		echo "$i. $choices[$i]"
	end

	echo "Enter the number of the file or directory you want to view:"
	read -P "Choice: " choice_number

	set selected_choice (echo $choices[$choice_number])

	if test -d "$project_directory/$selected_choice"
		echo "Contents of directory $selected_choice:"
		set choice_directory (ls -1 "$project_directory/$selected_choice")

		for obj in $choice_directory
			echo "- $obj"
		end
	else
		echo "File content of $selected_choice:"
		cat "$project_directory/$selected_choice"
	end
end

view_contents

# Task 5
#chmod u+x myscript.fish
#./myscript.fish

# Task 6
#cat $log_file
rm -rf $task_directory
