# SQFlite Demo App

## Overview
This is a Flutter application demonstrating CRUD (Create, Read, Update, Delete) operations using the **SQFlite** package for local SQLite database storage. The app provides a simple UI with buttons to perform database operations.

## Features
- Insert new records into the database
- Query and display all stored records
- Update existing records
- Delete records individually or clear all entries

## Technologies Used
- Flutter
- Dart
- SQFlite (SQLite database for Flutter)
- Path Provider (to locate the database directory)

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/Ruhisawant/SQL-Integration.git
   ```
2. Navigate to the project folder:
   ```sh
   cd sql_integration
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Usage
1. **Insert Data**: Click the "Insert" button to add a new record.
2. **Query Data**: Click the "Query" button to retrieve all records.
3. **Update Data**: Click the "Update" button to modify an existing record.
4. **Delete Data**: Click the "Delete" button to remove a record.

## License
This project is licensed under the MIT License.