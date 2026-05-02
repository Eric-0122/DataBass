# DataBass
Databass is a music storage database that stores song, artist, album, playlist, and user data. 
## Included Files
01_Create_DataBass_Schema.sql - this is the file that holds the creation of tables/automation  
02_initial_data_insert.sql - this file contains all of the original data inserts and is derived from a parser project that takes 
in the spotify million playlist json and converts it to insert into statements. Find the project code [here](https://github.com/SamMac55/dataLexer)  
03_extra_data_inserts.sql - a couple of extra inserts for songs and accreditations  
.csv - these csv files are extra inserts forthe songs and accreditations  
06_automation_demo.sql - this file has a demonstration of a transaction that uses our procedure/function/triggers  
07_queries.sql - these are the 5-10 required queries that demonstrate the database capabilites.
databass_db_export_file.sql - this is the exported database backup file  