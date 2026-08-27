# PostgreSQL

## Basic CRUD Operations

```sql
CREATE DATABASE students;

CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age SMALLINT,
    class SMALLINT
);

INSERT INTO students (id, name, age, class) 
VALUES (1, 'Anuj', 19, 12), (2, 'Aastha', 23, 15);

SELECT * FROM students;

UPDATE students SET age = 24 WHERE name = 'Aastha';

DELETE FROM students WHERE name = 'Anuj';

## PostgreSQL Data Types

| Data Type | Description | Example |
| --- | --- | --- |
| `SMALLINT` | Integer with a smaller range; useful for small numbers such as age or class. | `age SMALLINT` |
| `INT` / `INTEGER` | Standard integer type for whole numbers. | `id INT` |
| `BIGINT` | Integer type for very large whole numbers. | `population BIGINT` |
| `NUMERIC(p,s)` | Exact numeric type; useful when precision is important, such as money. `p` = total digits, `s` = digits after decimal. | `price NUMERIC(10,2)` |
| `REAL` | Single-precision floating-point number. | `temperature REAL` |
| `DOUBLE PRECISION` | Double-precision floating-point number; more precision than `REAL`. | `latitude DOUBLE PRECISION` |
| `SERIAL` | Auto-incrementing integer-like type commonly used for IDs. | `id SERIAL PRIMARY KEY` |
| `CHAR(n)` | Fixed-length character string. | `code CHAR(5)` |
| `VARCHAR(n)` | Variable-length character string with a maximum length. | `name VARCHAR(50)` |
| `TEXT` | Variable-length text without a specified maximum length. | `description TEXT` |
| `BOOLEAN` | Stores `TRUE` or `FALSE` values. | `is_active BOOLEAN` |
| `DATE` | Stores a date without a time. | `birth_date DATE` |
| `TIME` | Stores a time of day without a date. | `start_time TIME` |
| `TIMESTAMP` | Stores date and time without timezone information. | `created_at TIMESTAMP` |
| `TIMESTAMPTZ` | Stores date and time with timezone awareness. | `created_at TIMESTAMPTZ` |
| `INTERVAL` | Stores a duration or amount of time. | `duration INTERVAL` |

> **Note:** `SERIAL` is PostgreSQL-specific shorthand that creates an integer column backed by a sequence. For newer PostgreSQL designs, identity columns (`GENERATED ... AS IDENTITY`) are generally preferred.

---

## PostgreSQL Constraints

| Constraint | Description | Example |
| --- | --- | --- |
| `PRIMARY KEY` | Uniquely identifies each row | `id SERIAL PRIMARY KEY` |
| `NOT NULL` | Column must have a value | `name TEXT NOT NULL` |
| `UNIQUE` | No duplicate values allowed | `email TEXT UNIQUE` |
| `DEFAULT` | Provides default value if none | `created_at TIMESTAMP DEFAULT now()` |
| `CHECK` | Validates values | `age INT CHECK (age > 18)` |
| `FOREIGN KEY` | Links one table to another | `user_id INT REFERENCES users(id)` |

---

## Basic SQL Notes

### Create Database

```sql
CREATE DATABASE students;


```

Creates a new database named `students`.

### Create Table

```sql
CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age SMALLINT,
    class SMALLINT
);


```

* `PRIMARY KEY` uniquely identifies each row.
* `VARCHAR(50)` allows a string with a maximum length of 50 characters.
* `SMALLINT` is suitable for relatively small whole numbers.

### Insert Data

```sql
INSERT INTO students (id, name, age, class)
VALUES
    (1, 'Anuj', 19, 12),
    (2, 'Aastha', 23, 15);


```

Adds one or more rows to a table.

### Select Data

```sql
SELECT * FROM students;


```

Returns all columns and rows from the `students` table.

Useful variations:

```sql
SELECT name, age FROM students;

SELECT * FROM students WHERE age > 18;


```

### Update Data

```sql
UPDATE students
SET age = 24
WHERE name = 'Aastha';


```

Changes existing data.

> **Important:** Always use a `WHERE` condition when you only want to update specific rows. Without `WHERE`, all rows can be updated.

### Delete Data

```sql
DELETE FROM students
WHERE name = 'Anuj';


```

Deletes rows matching the condition.

> **Important:** `DELETE FROM students;` without a `WHERE` condition deletes all rows from the table.

---

## Quick CRUD Reference

| Operation | SQL Command |
| --- | --- |
| Create | `CREATE TABLE ...` |
| Read | `SELECT ...` |
| Update | `UPDATE ... SET ... WHERE ...` |
| Delete | `DELETE FROM ... WHERE ...` |

```

---

## SQL Clauses Overview

| Clause | Description |
| --- | --- |
| `SELECT` | Choose which columns to display |
| `FROM` | Specify the table |
| `WHERE` | Filter rows based on a condition |
| `GROUP BY` | Group rows for aggregation |
| `HAVING` | Filter aggregated groups (used after GROUP BY) |
| `ORDER BY` | Sort the result in ascending or descending order |
| `LIMIT` | Limit the number of rows returned |
| `AS` | Rename columns or tables temporarily (aliasing) |
| `DISTINCT` | Return only unique/distinct values |

---