# 🗄️ DBMS Laboratory

> A comprehensive collection of SQL and NoSQL experiments for the Database Management Systems laboratory.

![DBMS](https://img.shields.io/badge/Database-System-blue?style=for-the-badge&logo=postgresql)
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)

Welcome to the **DBMS Laboratory** repository! This project houses a series of structured database scenarios designed to master the fundamentals of relational (RDBMS) and non-relational (NoSQL) database systems.

---

## 📂 Project Structure

The repository is organized into five main modules, each representing a distinct real-world scenario.

| Module | Type | Description |
| :--- | :---: | :--- |
| **[Library Database](./librarydb)** | SQL | 📚 Manage books, authors, publishers, and lending branches. |
| **[College Database](./collegedb)** | SQL | 🎓 Track students, semesters, classes, and assessment marks. |
| **[Company Database](./companydb)** | SQL | 🏢 Handle employee records, departments, projects, and payroll. |
| **[Employee Database](./employeedb)** | NoSQL | 👨‍💼 Store complex employee profiles with nested address data. |
| **[Restaurant Database](./resturantdb)** | NoSQL | 🍽️ A directory of restaurants featuring location-based queries. |

---

## 🚀 Getting Started

### Prerequisites
*   **MySQL Server** (or any standard SQL client)
*   **MongoDB Shell** (`mongosh`)

### 🛠️ Running SQL Scripts
Each SQL directory contains scripts for creation, insertion, and querying.

1.  **Create the Database & Tables:**
    ```bash
    mysql -u root -p < collegedb/collegedb_creation.sql
    ```
2.  **Populate Data:**
    ```bash
    mysql -u root -p < collegedb/collegedb_data_entry.sql
    ```
3.  **Run Queries:**
    You can run queries interactively in your SQL shell using the logic found in the `*_queries.sql` files.

### 🍃 Running MongoDB Scripts
The NoSQL modules use JavaScript files compatible with the Mongo shell.

```bash
# Execute an insertion script directly
mongosh < employeedb/q4_insertion.js
```

---

## 📖 Documentation & Resources

*   **[DBMS_LAB_PROGRAMS.pdf](./DBMS_LAB_PROGRAMS.pdf)**: The official problem statements and laboratory manual.
*   **[CHEATSHEET.md](./CHEATSHEET.md)**: ⚡ **Highly Recommended.** A quick-reference guide containing:
    *   Full Schema Definitions
    *   Logic Explanations
    *   Ready-to-use Queries for every lab question.

---

## 🧩 Schemas at a Glance

### SQL Tables
*   **Library:** `BOOK`, `BOOK_AUTHORS`, `PUBLISHER`, `BOOK_COPIES`, `BOOK_LENDING`, `LIBRARY_BRANCH`
*   **College:** `STUDENT`, `SEMSEC`, `CLASS`, `SUBJECT`, `IAMARKS`
*   **Company:** `EMPLOYEE`, `DEPARTMENT`, `DLOCATION`, `PROJECT`, `WORKS_ON`

### NoSQL Collections
*   **Employee:** `{ eid, ename, dept, design, salary, yoj, address: { ... } }`
*   **Restaurant:** `{ Name, address: { ... }, cuisine, landmarks: [], online_delivery }`

---

*Happy Querying!*
