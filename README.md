# DataBass
Databass is a music storage database that stores song, artist, album, playlist, and user data.
<img width="4012" height="2883" alt="DataBass Schema (2)" src="https://github.com/user-attachments/assets/599a18ba-7850-4cf9-b6ef-c6e9afeacef1" />
## Included Files
- 01_Create_DataBass_Schema.sql - this is the file that holds the creation of tables/automation
- 02_initial_data_insert.sql - this file contains all of the original data inserts and is derived from a parser project that takes 
in the spotify million playlist json and converts it to insert into statements. Find the project code [here](https://github.com/SamMac55/dataLexer)
- 03_extra_data_inserts.sql - a couple of extra inserts for songs and accreditations  
- .csv - these csv files are extra inserts forthe songs and accreditations  
- 06_automation_demo.sql - this file has a demonstration of a transaction that uses our procedure/function/triggers  
- 07_queries.sql - these are the 5-10 required queries that demonstrate the database capabilites.
- databass_db_export_file.sql - this is the exported database backup file
## Demonstration Video
Watch our demonstration video! It explains our schema and database in depth!  
[click here](https://youtu.be/hEBVxVTsqzg) 

