## Multi-Use Bash Scripts 

A collection of multi-purpose CLI bash scripts.

## Songs Library

A bash script to maintain your list of favourite songs. Enables easy addition, deletion, updation, searching, and filtering on the basis of artist, album, genre etc.

### Run

	`./songs.sh -h`

	Use -h flag to open the man page: displays how to use all commands

### Features

* **Add**: 
	* Add a song using flags for Song, Artist, Album, and Genre fields
	* Assigns a unique ID to each song 
	* Checks for duplication of song by considering Song and Artist together

* **Display**: 
	* Displays all songs in a table format

* **View**: 
	* Filter songs based on artist, album, and genre. Displays the filtered entries in a table format.

* **Edits**: 

	* Edit details of a song, based on ID. It updates only the specified field and not all entries, song remains in the same place in CSV file

* **Delete**: 

	* Delete using ID of song



## Search Engine
Count the number of times a given string occurs in the content of a web page.
	
### Run
`./searching.sh word URL`

### Features

* Case insensitive word search on the source of a web page - removes script,style and html tags before searching to ensure we are just searching just the content on the page and not other source code
* Checks the validity of the URL
* Alerts if number of arguments is incorrect or if arguments are reversed


## Timer
A script to increase productivity by breaking down work into intervals, followed by small breaks.

### Run
	
	 `./timer.sh number_of_cycles`

		-> Submission includes "timer.sh" and the bonus question with notifications "timerbonus.sh"



Question 4.

	Reminders

		Usage: ./reminder.sh -h

		Use -h flag (as shown above) for the man page: displays how to use all commands

		-> Uses flags to get inputs of Time, Date and Reminder
		-> Assigns a unique ID to each Reminder 
		-> Edits using ID and changes only the specified field - does not require the user to input all the information again
		-> Run setup.sh to install at



Question 5.

		Script names: script1.sh, script2.sh
		
		-> All other files (csv,txt) are attached



Question 6.
	
		Usage: ./2018101071.sh <movies_rating_file_path> <all_movies_folder_path>
		