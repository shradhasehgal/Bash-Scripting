# Multi-purpose Bash Scripts 

A collection of multi-purpose CLI bash scripts.

<br /> 

## Songs Library

Maintain a list of your favourite songs (stored as CSV file). It enables easy addition, deletion, updation, searching of songs, and filtering on the basis of artist, album, genre etc.

### Run

	./songs.sh -h
`-h` flag opens the man page which displays how to use all the features.

### Features

* **Add**: 
	* Add a song using flags for Song, Artist, Album, and Genre fields.
	* Assigns a unique ID to each song.
	* Checks for duplication of song by considering Song and Artist together.

* **Display**: 
	* Displays all songs in a table format.

* **View**: 
	* Filter songs based on artist, album, and genre. Displays the filtered entries in a table format.

* **Edit**: 

	* Edit details of a song, based on ID. It updates only the specified field and not all entries, song remains in the same place in CSV file.

* **Delete**: 

	* Delete song on the basis of ID.



<br /> 


## Search Engine
Counts the number of times a given string occurs in the content of a web page.
	
### Run
	./searching.sh word URL

### Features

* Case insensitive word search on the source of a web page - removes script,style and html tags before searching to ensure we are just searching just the content on the page and not other source code.
* Checks the validity of the URL.
* Alerts if number of arguments is incorrect or if arguments are reversed.


<br /> 

## Timer
Increases productivity by breaking down work into intervals of 25 min, followed by small breaks for 5 min, and sending notifications for the same.

### Run
	
	./timer.sh number_of_cycles

### Features

* Sends a notification for 'Work' (25 min) and 'Break Time' (5 min) for the specified number of iterations.
* `timerbasic.sh` prints alerts to the terminal, instead of sending notifications.

<br /> 

## Reminders

Allows you to create, edit, list, delete and send reminders as desktop notifications.

### Run 
	
	1. Run  './setup.sh' to install all dependencies.
	2. Run  './reminder.sh -h' to open the man page - displays how to use all features.

### Features

* **Create** 
	* Sets a reminder by using flags to get inputs of Time, Date and Reminder.
	* Assigns a unique ID to each Reminder.

* **List**
	* Lists all reminders that are pending.

* **Delete**
	* Deletes reminder from the list, as well as from the `at` scheduler so that we don't receive a notification. 

* **Edit**
	* Edits on the basis of ID and changes only the specified field - does not require the user to input all the information again.
		
<br /> 

## Movies-Filter
	
Categorizes movies into 4 sets - Bad, Average, Good, and Awesome based on their IMDb ratings.

### Run

	./2018101071.sh <movies_rating_file_path> <all_movies_folder_path>

### Features

* Creates 4 directories 'Bad, Average, Good, and Awesome' in the <all_movies_folder_path>
* Filters movies based on the ratings and create that movie's file in one of the 4 folders. 
<br> **Note**: `movies_rating_file` has to be of the format: `movie_name: rating` 
* Error handling for incorrect number / types of arguments. 
