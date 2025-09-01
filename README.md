# Best-Diagnostics-Clinical-Laboratory-Database-and-SQL-Analysis

![License](https://img.shields.io/badge/license-MIT-green)  
![SQL](https://img.shields.io/badge/SQL-Server-blue) 

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
- Database Design: ERD modeling for a clinical laboratory system.
- SQL Schema Creation: Structured tables with relationships.
- Data Insertion: Realistic sample data for testing queries.
- Complex Queries: Joins, aggregations, filtering, grouping.
- Use Case Scenarios: Practical queries for lab insights (e.g., most requested tests, revenue tracking, abnormal results).

## Technologies Used

- SQL Server Management Systems (SSMS): Database management system for storing and querying structured clinical data.
- Draw.io: For Entity-Relationship Diagram (ERD) design.
- Excel : For preparing and inserting dummy datasets.
- GitHub : For version control and project documentation.

## Database Design Approach

- Database Design Principles – Ensured logical structure and integrity of data.
- Normalization (up to 3NF) – Removed redundancy and ensured efficient data storage.
- Entity-Relationship Diagram (ERD) – Designed to capture real-world relationships among patients, doctors, tests, lab results etc


## Entity-Relationship Diagram (ERD)

<img width="2252" height="1187" alt="Untitled (3)" src="https://github.com/user-attachments/assets/ac6f70db-2b8c-4f0d-81b7-5ee6676fa2d3" />

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

## Project Structure

├── schema/           
├── data/           
├── insert/  
├── queries/                 
├── ERD/               
├── README.md         
└── LICENSE

## Insights Generated
Some insights generated from this database include:
- Frequently requested laboratory tests
- Departmental workload
- Inactive assets
- Patient request frequency
- HMO value analysis

### Example Query:
**1. HMO Value Analysis**
**Question:** Which HMOs brought in the most test volume and revenue?  
**Insight:** Shows which HMOs contribute most to the business.  

```sql
SELECT h.hmo_name,h.hmoid,count (p.paymentID) as HMOVolume, sum(p.amount_paid) as total_paid
from HMO h
JOIN Payment p
ON h.hmoID=p.hmo_id
GROUP BY h.hmoid, h.hmo_name
ORDER BY total_paid DESC;
```
**2. Test Profitability**
**Question:** What is the total revenue per test type?
**Insight:** It helps find which tests are not only popular, but profitable

```sql
SELECT t.testid,t.test_name,COUNT (p.requestid)no_of_tests ,SUM (p.amount_paid)AS total_revenue
FROM Test AS t
JOIN Testrequest AS tr
on t.testid=tr.testid
JOIN payment as p
ON tr.requestID=p.requestId
GROUP BY t.testid, t.test_name
ORDER BY total_revenue DESC;
```

## License
 This project is licensed under the MIT License.

## Author
**Benita Nworji**  
Medical Laboratory Scientist | Data Analyst  

🔗 [LinkedIn](https://www.linkedin.com/in/benita-nworji)  
 ✉️ benitanworji01@gmail.com 


