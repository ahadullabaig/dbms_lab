# DBMS Laboratory Cheatsheet

A quick reference guide for the DBMS Laboratory programs.

---

## **1. Library Database**
**Schema:**
* `BOOK` (Book_id, Title, Publisher_Name, Pub_Year)
* `BOOK_AUTHORS` (Book_id, Author_Name)
* `PUBLISHER` (Name, Address, Phone)
* `BOOK_COPIES` (Book_id, Branch_id, No_of_Copies)
* `BOOK_LENDING` (Book_id, Branch_id, Card_No, Date_Out, Due_Date)
* `LIBRARY_BRANCH` (Branch_id, Branch_Name, Address)

### **Q1: Retrieve details of all books**
*   **Goal:** List book title, publisher, author, and copies per branch.
*   **Logic:** Join `BOOK` $\to$ `BOOK_AUTHORS` $\to$ `BOOK_COPIES` $\to$ `LIBRARY_BRANCH`.
*   **Query:**
    ```sql
    SELECT B.Book_id, B.Title, B.Publisher_Name, A.Author_Name, C.No_of_Copies, L.Branch_Name
    FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_BRANCH L
    WHERE B.Book_id = A.Book_id
      AND B.Book_id = C.Book_id
      AND C.Branch_id = L.Branch_id;
    ```

### **Q2: Borrowers > 3 Books (Jan-Jun 2017)**
*   **Goal:** Find borrowers with > 3 books in a specific date range.
*   **Logic:** Filter by date $\to$ Group by Card_No $\to$ Filter groups with `HAVING`.
*   **Key Date Format:** `'YYYY-MM-DD'` (e.g., `'2017-01-01'`).
*   **Query:**
    ```sql
    SELECT Card_No
    FROM BOOK_LENDING
    WHERE Date_Out BETWEEN '2017-01-01' AND '2017-06-30'
    GROUP BY Card_No
    HAVING COUNT(*) > 3;
    ```

### **Q3: Delete a Book**
*   **Goal:** Delete a book and ensure it's removed from linked tables.
*   **Logic:** `DELETE` from the parent table (`BOOK`).
*   **Note:** This relies on `ON DELETE CASCADE` being set in the table creation for `BOOK_AUTHORS`, `BOOK_COPIES`, etc.
*   **Query:**
    ```sql
    DELETE FROM BOOK
    WHERE Book_id = '101'; -- Replace with specific ID
    ```

### **Q4: View of Available Books**
*   **Goal:** Virtual table of books and their copy counts.
*   **Logic:** `CREATE VIEW` + Simple Join (`BOOK` & `BOOK_COPIES`).
*   **Query:**
    ```sql
    CREATE VIEW V_Books AS
    SELECT B.Book_id, B.Title, C.No_of_Copies
    FROM BOOK B, BOOK_COPIES C
    WHERE B.Book_id = C.Book_id;
    ```

---

## **2. College Database**
**Schema:**
* `STUDENT` (USN, SName, Address, Phone, Gender)
* `SEMSEC` (SSID, Sem, Sec)
* `CLASS` (USN, SSID)
* `SUBJECT` (Subcode, Title, Sem, Credits)
* `IAMARKS` (USN, Subcode, SSID, Test1, Test2, Test3, FinalIA)

### **Q1: Students in Sem 4, Sec 'C'**
*   **Goal:** List students in a specific class.
*   **Logic:** Join `STUDENT` $\to$ `CLASS` $\to$ `SEMSEC`.
*   **Query:**
    ```sql
    SELECT S.*
    FROM STUDENT S, CLASS C, SEMSEC SS
    WHERE S.USN = C.USN
      AND C.SSID = SS.SSID
      AND SS.Sem = 4 AND SS.Sec = 'C';
    ```

### **Q2: Gender Count per Sem/Sec**
*   **Goal:** Count Males/Females in every class.
*   **Logic:** Group by 3 columns (`Sem`, `Sec`, `Gender`).
*   **Query:**
    ```sql
    SELECT SS.Sem, SS.Sec, S.Gender, COUNT(*) as Count
    FROM STUDENT S, CLASS C, SEMSEC SS
    WHERE S.USN = C.USN AND C.SSID = SS.SSID
    GROUP BY SS.Sem, SS.Sec, S.Gender;
    ```

### **Q3: View for Test1 Marks**
*   **Goal:** View specific marks for a specific student.
*   **Query:**
    ```sql
    CREATE VIEW Test1_View AS
    SELECT Subcode, Test1
    FROM IAMARKS
    WHERE USN = '1BI15CS101';
    ```

### **Q4: Calculate Final IA**
*   **Goal:** Average of best two test marks.
*   **Logic:** `(Sum - Minimum) / 2`.
*   **Query:**
    ```sql
    UPDATE IAMARKS
    SET FinalIA = (Test1 + Test2 + Test3 - LEAST(Test1, Test2, Test3)) / 2;
    ```

### **Q5: List Subjects by Credits**
*   **Goal:** Sort subjects.
*   **Logic:** `ORDER BY` clause.
*   **Query:**
    ```sql
    SELECT *
    FROM SUBJECT
    ORDER BY Credits ASC;
    ```

---

## **3. Company Database**
**Schema:**
* `EMPLOYEE` (SSN, Name, Address, Sex, Salary, SuperSSN, DNo)
* `DEPARTMENT` (DNo, DName, MgrSSN, MgrStartDate)
* `DLOCATION` (DNo, DLoc)
* `PROJECT` (PNo, PName, PLocation, DNo)
* `WORKS_ON` (SSN, PNo, Hours)

### **Q1: The "Scott" Project List**
*   **Goal:** Projects where Scott is a Worker **OR** a Manager.
*   **Logic:** `UNION` of two queries.
    1.  Find Scott as Employee $\to$ Join `WORKS_ON`.
    2.  Find Scott as Manager $\to$ Join `DEPARTMENT` $\to$ Join `PROJECT`.
*   **Query:**
    ```sql
    -- Scott as Worker
    SELECT P.PNo
    FROM PROJECT P, WORKS_ON W, EMPLOYEE E
    WHERE P.PNo = W.PNo AND W.SSN = E.SSN AND E.Name LIKE '%Scott'
    UNION
    -- Scott as Manager
    SELECT P.PNo
    FROM PROJECT P, DEPARTMENT D, EMPLOYEE E
    WHERE P.DNo = D.DNo AND D.MgrSSN = E.SSN AND E.Name LIKE '%Scott';
    ```

### **Q2: The IoT Raise**
*   **Goal:** Show potential salaries if 10% raise given to IoT workers.
*   **Logic:** Join `EMPLOYEE`, `WORKS_ON`, `PROJECT`. Multiply Salary.
*   **Query:**
    ```sql
    SELECT E.Name, E.Salary * 1.1 AS New_Salary
    FROM EMPLOYEE E, WORKS_ON W, PROJECT P
    WHERE E.SSN = W.SSN
      AND W.PNo = P.PNo
      AND P.PName = 'IoT';
    ```

### **Q3: Accounts Dept Stats**
*   **Goal:** Aggregates for a specific department.
*   **Logic:** Join `EMPLOYEE` and `DEPARTMENT`. Use `SUM`, `MAX`, `MIN`, `AVG`.
*   **Query:**
    ```sql
    SELECT SUM(E.Salary), MAX(E.Salary), MIN(E.Salary), AVG(E.Salary)
    FROM EMPLOYEE E, DEPARTMENT D
    WHERE E.DNo = D.DNo
      AND D.DName = 'Accounts';
    ```

### **Q4: Work on ALL Projects (The "Division" Query)**
*   **Goal:** Employees working on *every* project of a specific department.
*   **Logic:** Use `NOT EXISTS` twice (Double Negation). "Find employees where there is NO project (in Dept X) that they do NOT work on."
*   **Query:**
    ```sql
    SELECT E.Name
    FROM EMPLOYEE E
    WHERE NOT EXISTS (
        SELECT P.PNo FROM PROJECT P WHERE P.DNo = 1 -- Target Dept
        AND NOT EXISTS (
            SELECT W.PNo FROM WORKS_ON W
            WHERE W.PNo = P.PNo AND W.SSN = E.SSN
        )
    );
    ```

### **Q5: High Earners in Large Departments**
*   **Goal:** For depts with > 5 employees, count those earning > 600,000.
*   **Logic:**
    1.  Subquery: Find `DNo` groups with `COUNT(*) > 5`.
    2.  Main Query: Filter `EMPLOYEE` by those Depts AND Salary > 600k.
    3.  Group again to count high earners.
*   **Query:**
    ```sql
    SELECT DNo, COUNT(*)
    FROM EMPLOYEE
    WHERE Salary > 600000
      AND DNo IN (
          SELECT DNo
          FROM EMPLOYEE
          GROUP BY DNo
          HAVING COUNT(*) > 5
      )
    GROUP BY DNo;
    ```

---

### **Final Pre-Exam Tips**

1.  **Circular Error:** If you can't insert Employee because Dept doesn't exist, and can't insert Dept because Manager (Employee) doesn't exist -> **Insert Dept with NULL Manager first**.
2.  **Dates:** Always `'YYYY-MM-DD'`.
3.  **Strings:** Always single quotes `'Text'`.

**Good luck! You have practiced every single one of these. Trust your syntax.**