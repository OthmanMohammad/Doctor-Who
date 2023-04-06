# Doctor Who Database Project

The Doctor Who project is a database project based on the British science fiction television program. The purpose of the project is to create a database that contains information about the Doctor Who universe, including data on episodes, doctors, companions, and enemies. 

The main goal of the project is to provide an opportunity to learn and practice TSQL and database design principles. By creating a functional database based on the Doctor Who universe, the project allows for hands-on experience with creating and populating tables, creating relationships and constraints, performing queries, creating functions, stored procedures and views, and other tasks commonly associated with database development. 

## Getting Started

### Prerequisites

Before running this project, you need to have the following:

* Familiarity with SQL
* MS SQL SERVER Installed

### Installation

To install the project, follow these steps:

1. Clone the repository
2. Open the script file in MS SQL SERVER
3. Run the script file to create the database and tables
4. Run the script file to populate the tables
5. Run the script file to create the functions, stored procedures, and views
6. Perform queries as needed

## Tasks Completed

The following tasks were completed in this project:

1. Created a DB named `DoctorWho`.
2. Wrote scripts to create the tables, keys, relationships and constraints.
3. Wrote scripts to insert at least 5 records in each table.
4. Wrote a script to update the episode name to `{ORIGINAL_EPISODE_NAME}_CANCELLED` for only the episodes with zero doctor appearances.
5. Wrote a query to delete all companions who didn't appear on an episode.
6. Created a function called **`fnCompanions`** to printout the companions names for a given episode.
7. Created a function called **`fnEnemies`** to printout the enemies names for a given episode.
8. Created a SQL view called **`viewEpisodes`** to list out all episodes, including author name, doctor name, companions and enemies. The previously created functions are used in the view.
9. Created a stored procedure called **`spSummariseEpisodes`** to show the 3 most frequently-appearing companions, and the 3 most frequently-appearing enemies separately.

## Usage

This project is intended to be used as a reference for a database project. You can use this project as a guide for creating your own database project or modify it to suit your needs.

## Contributing

Contributions to this project are welcome. If you have a suggestion for improvement, please create a pull request.

## Author

This project was created by [Mohammad Othman](https://github.com/OthmanMohammad) and is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


