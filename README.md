# FILE_SYSTEM_HANDLE
Scripts to copy, move, delete select or bulk files with command line arguments in Java, PHP, Python, R, and VBA.

Each script runs six methods requested by user where:
- Select files management handles select files by regex pattern 
- Bulk files management handles all files referenced in source directory

Following methods receives the listed parameters which users can enter via command line (except VBA entered via spreadsheet):

1. copy_select_files(source_location, destination_location, pattern)
2. move_select_files(source_location, destination_location, pattern)
3. delete_select_files(source_location, pattern)

4. copy_bulk_files(source_location, destination_location)
5. move_bulk_files(source_location, destination_location)
6. delete_bulk_files(source_location)
