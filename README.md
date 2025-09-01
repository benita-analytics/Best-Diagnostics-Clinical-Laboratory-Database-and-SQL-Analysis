# Best-Diagnostics-Clinical-Laboratory-Database-and-SQL-Analysis
This is a structured SQL-based project designed to model, organize, and manage clinical laboratory data in a reliable and efficient way. It features an ERD, SQL queries, and structured workflows for patient testing, data management, and reporting.
## Project Overview
This project demonstrates the design, implementation, and querying of a relational database for a clinical diagnostics laboratory. The goal is to showcase how structured data can be effectively managed, analyzed, and retrieved using SQL.
The database is modeled to reflect real-world operations within a diagnostic laboratory, including patients, medical tests, laboratory staff, results, and billing records.
 
 This project highlights my ability to:
- Design an Entity-Relationship Diagram (ERD) for a healthcare setting.
- Create normalized SQL tables with  constraints, primary and foreign keys.
- Populate the database with sample clinical data.
- Perform SQL queries to extract meaningful insights for reporting and decision-making.
- Demonstrate use cases for lab administrators and clinicians.

## Key Features
- Database Design: ERD modeling for a clinical laboratory system
- SQL Schema Creation: Structured tables with relationships
- Data Insertion: Realistic sample data for testing queries.
- Complex Queries: Joins, aggregations, filtering, grouping
- Use Case Scenarios: Practical queries for lab insights (e.g., most requested tests, revenue tracking, abnormal results)

## Entity-Relationship Diagram (ERD)

(Insert your ERD image here — e.g., ![ERD](docs/erd.png))

The ERD models relationships between:
- Doctor
- Department
- HMO
- LabScientists
- Patients
- Payment
- Test
- TestRequest
- TestResult

## Example Queries  

Some insights generated from this database include:

- Frequently requested laboratory tests
- Departmental workload
- Inactive assets
- Patient request frequency
- HMO value analysis

## Technologies Used

- SQL Server Management Systems (SSMS): Database management system for storing and querying structured clinical data.
- Draw.io – For Entity-Relationship Diagram (ERD) design.
- Excel – Used for preparing and inserting dummy datasets
- GitHub – For version control and project documentation.

## Database Design Approach

- Database Design Principles – Ensured logical structure and integrity of data.
- Normalization (up to 3NF) – Removed redundancy and ensured efficient data storage.
- Entity-Relationship Diagram (ERD) – Designed to capture real-world relationships among patients, doctors, tests, lab results etc

## Author
Benita Nworji

🎓 Medical Laboratory Scientist | Data Analyst

🌍 Passionate about combining healthcare and data to improve diagnostics

🔗 LinkedIn Profile
 Portfolio












📁 Best-Diagnostics
 ┣ 📜 schema.sql        # SQL scripts for table creation
 ┣ 📜 data_insertion.sql # Sample data population
 ┣ 📜 queries.sql       # Analytical SQL queries
 ┣ 📜 erd.png           # Entity-Relationship Diagram
 ┗ 📜 README.md         # Project documentation
