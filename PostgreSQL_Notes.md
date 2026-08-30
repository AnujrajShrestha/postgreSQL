\# PostgreSQL

\## Basic CRUD Operations

\`\`\`sql

CREATE DATABASE students;

CREATE TABLE students(

    id INT PRIMARY KEY,

    name VARCHAR(50),

    age SMALLINT,

    class SMALLINT

);

INSERT INTO students (id, name, age, class) 

VALUES 

    (1, 'Anuj', 19, 12),

    (2, 'Aastha', 23, 15);

SELECT \* FROM students;

UPDATE students 

SET age = 24 

WHERE name = 'Aastha';

DELETE FROM students 

WHERE name = 'Anuj';

\`\`\`

\---

\## PostgreSQL Data Types

\| Data Type          | Description                                                                                                            | Example                     |

\| ------------------ | ---------------------------------------------------------------------------------------------------------------------- | --------------------------- |

\| \`SMALLINT\`         | Integer with a smaller range; useful for small numbers such as age or class.                                           | \`age SMALLINT\`              |

\| \`INT\` / \`INTEGER\`  | Standard integer type for whole numbers.                                                                               | \`id INT\`                    |

\| \`BIGINT\`           | Integer type for very large whole numbers.                                                                             | \`population BIGINT\`         |

\| \`NUMERIC(p,s)\`     | Exact numeric type; useful when precision is important, such as money. \`p\` = total digits, \`s\` = digits after decimal. | \`price NUMERIC(10,2)\`       |

\| \`REAL\`             | Single-precision floating-point number.                                                                                | \`temperature REAL\`          |

\| \`DOUBLE PRECISION\` | Double-precision floating-point number; more precision than \`REAL\`.                                                    | \`latitude DOUBLE PRECISION\` |

\| \`SERIAL\`           | Auto-incrementing integer-like type commonly used for IDs.                                                             | \`id SERIAL PRIMARY KEY\`     |

\| \`CHAR(n)\`          | Fixed-length character string.                                                                                         | \`code CHAR(5)\`              |

\| \`VARCHAR(n)\`       | Variable-length character string with a maximum length.                                                                | \`name VARCHAR(50)\`          |

\| \`TEXT\`             | Variable-length text without a specified maximum length.                                                               | \`description TEXT\`          |

\| \`BOOLEAN\`          | Stores \`TRUE\` or \`FALSE\` values.                                                                                       | \`is\_active BOOLEAN\`         |

\| \`DATE\`             | Stores a date without a time.                                                                                          | \`birth\_date DATE\`           |

\| \`TIME\`             | Stores a time of day without a date.                                                                                   | \`start\_time TIME\`           |

\| \`TIMESTAMP\`        | Stores date and time without timezone information.                                                                     | \`created\_at TIMESTAMP\`      |

\| \`TIMESTAMPTZ\`      | Stores date and time with timezone awareness.                                                                          | \`created\_at TIMESTAMPTZ\`    |

\| \`INTERVAL\`         | Stores a duration or amount of time.                                                                                   | \`duration INTERVAL\`         |

\> **\*\*Note:\*\*** \`SERIAL\` is PostgreSQL-specific shorthand that creates an integer column backed by a sequence. For newer PostgreSQL designs, identity columns (\`GENERATED ... AS IDENTITY\`) are generally preferred.

\---

\## PostgreSQL Constraints

\| Constraint    | Description                                   | Example                              |

\| ------------- | --------------------------------------------- | ------------------------------------ |

\| \`PRIMARY KEY\` | Uniquely identifies each row.                 | \`id SERIAL PRIMARY KEY\`              |

\| \`NOT NULL\`    | Column must have a value.                     | \`name TEXT NOT NULL\`                 |

\| \`UNIQUE\`      | No duplicate values are allowed.              | \`email TEXT UNIQUE\`                  |

\| \`DEFAULT\`     | Provides a default value if none is supplied. | \`created\_at TIMESTAMP DEFAULT now()\` |

\| \`CHECK\`       | Validates values using a condition.           | \`age INT CHECK (age > 18)\`           |

\| \`FOREIGN KEY\` | Links one table to another.                   | \`user\_id INT REFERENCES users(id)\`   |

\---

\## Basic SQL Notes

\### Create Database

\`\`\`sql

CREATE DATABASE students;

\`\`\`

Creates a new database named \`students\`.

\### Create Table

\`\`\`sql

CREATE TABLE students(

    id INT PRIMARY KEY,

    name VARCHAR(50),

    age SMALLINT,

    class SMALLINT

);

\`\`\`

\* \`PRIMARY KEY\` uniquely identifies each row.

\* \`VARCHAR(50)\` allows a string with a maximum length of 50 characters.

\* \`SMALLINT\` is suitable for relatively small whole numbers.

\### Insert Data

\`\`\`sql

INSERT INTO students (id, name, age, class)

VALUES

    (1, 'Anuj', 19, 12),

    (2, 'Aastha', 23, 15);

\`\`\`

Adds one or more rows to a table.

\### Select Data

\`\`\`sql

SELECT \* FROM students;

\`\`\`

Returns all columns and rows from the \`students\` table.

\#### Useful Variations

\`\`\`sql

SELECT name, age 

FROM students;

SELECT \* 

FROM students 

WHERE age > 18;

\`\`\`

\### Update Data

\`\`\`sql

UPDATE students

SET age = 24

WHERE name = 'Aastha';

\`\`\`

Changes existing data.

\> **\*\*Important:\*\*** Always use a \`WHERE\` condition when you only want to update specific rows. Without \`WHERE\`, all rows can be updated.

\### Delete Data

\`\`\`sql

DELETE FROM students

WHERE name = 'Anuj';

\`\`\`

Deletes rows matching the condition.

\> **\*\*Important:\*\*** \`DELETE FROM students;\` without a \`WHERE\` condition deletes all rows from the table.

\---

\## Quick CRUD Reference

\| Operation | SQL Command                    |

\| --------- | ------------------------------ |

\| Create    | \`CREATE TABLE ...\`             |

\| Read      | \`SELECT ...\`                   |

\| Update    | \`UPDATE ... SET ... WHERE ...\` |

\| Delete    | \`DELETE FROM ... WHERE ...\`    |

\---

\# SQL Clauses Overview

SQL clauses are keywords used to retrieve, filter, group, sort, and limit data.

\| Clause     | Description                                       |

\| ---------- | ------------------------------------------------- |

\| \`SELECT\`   | Choose which columns to display.                  |

\| \`FROM\`     | Specify the table.                                |

\| \`WHERE\`    | Filter rows based on a condition.                 |

\| \`GROUP BY\` | Group rows for aggregation.                       |

\| \`HAVING\`   | Filter aggregated groups.                         |

\| \`ORDER BY\` | Sort the result in ascending or descending order. |

\| \`LIMIT\`    | Limit the number of rows returned.                |

\| \`AS\`       | Create an alias for columns or tables.            |

\| \`DISTINCT\` | Return only unique values.                        |

\---

\## SQL Clauses

SQL clauses are keywords used to filter, group, sort, and control the data returned by a query.

\### 1. SELECT

Used to specify which columns you want to retrieve.

\`\`\`sql

SELECT name, price

FROM products;

\`\`\`

\* \`SELECT \*\` → returns all columns.

\* \`SELECT name, price\` → returns only the specified columns.

\---

\### 2. FROM

Specifies the table from which the data is retrieved.

\`\`\`sql

SELECT \*

FROM products;

\`\`\`

\* \`FROM products\` → retrieves data from the \`products\` table.

\---

\### 3. WHERE

Used to filter rows based on a condition.

\`\`\`sql

SELECT \*

FROM products

WHERE category = 'Electronics';

\`\`\`

\* Only rows satisfying the condition are returned.

\* Common operators: \`=\`, \`!=\`, \`>\`, \`<\`, \`>=\`, \`<=\`.

\---

\### 4. GROUP BY

Groups rows that have the same value in one or more columns.

\`\`\`sql

SELECT category

FROM products

GROUP BY category;

\`\`\`

Often used with aggregate functions such as:

\* \`COUNT()\`

\* \`SUM()\`

\* \`AVG()\`

\* \`MIN()\`

\* \`MAX()\`

Example:

\`\`\`sql

SELECT category, COUNT(\*)

FROM products

GROUP BY category;

\`\`\`

\---

\### 5. HAVING

Filters groups created by \`GROUP BY\`.

\`\`\`sql

SELECT category, COUNT(\*)

FROM products

GROUP BY category

HAVING COUNT(\*) > 1;

\`\`\`

\* \`WHERE\` → filters individual rows.

\* \`HAVING\` → filters grouped/aggregated results.

\---

\### 6. ORDER BY

Sorts the result based on one or more columns.

\`\`\`sql

SELECT \*

FROM products

ORDER BY price ASC;

\`\`\`

\* \`ASC\` → ascending order.

\* \`DESC\` → descending order.

Example:

\`\`\`sql

SELECT \*

FROM products

ORDER BY price DESC;

\`\`\`

\---

\### 7. LIMIT

Limits the number of rows returned.

\`\`\`sql

SELECT \*

FROM products

LIMIT 3;

\`\`\`

\* Returns only the first 3 rows.

\---

\### 8. AS

Creates a temporary alias (alternative name) for a column or table.

\`\`\`sql

SELECT 

    name AS Item\_Name,

    price AS Item\_Price

FROM products;

\`\`\`

\* \`AS\` makes output column names easier to understand.

\* The original column name in the table is not changed.

\---

\### 9. DISTINCT

Removes duplicate values from the result.

\`\`\`sql

SELECT DISTINCT category

FROM products;

\`\`\`

\* Returns each category only once.

\---

\## Clause Order

A typical SQL query follows this order:

\`\`\`sql

SELECT column

FROM table

WHERE condition

GROUP BY column

HAVING condition

ORDER BY column

LIMIT number;

\`\`\`

\### Example

\`\`\`sql

SELECT 

    category, 

    COUNT(\*) AS total\_products

FROM products

WHERE price > 100

GROUP BY category

HAVING COUNT(\*) > 1

ORDER BY total\_products DESC

LIMIT 3;

\`\`\`

\---

\## Quick Clause Reference

\| Clause     | Purpose                          |

\| ---------- | -------------------------------- |

\| \`SELECT\`   | Choose columns to display.       |

\| \`FROM\`     | Specify the table.               |

\| \`WHERE\`    | Filter individual rows.          |

\| \`GROUP BY\` | Group rows with the same values. |

\| \`HAVING\`   | Filter grouped results.          |

\| \`ORDER BY\` | Sort the result.                 |

\| \`LIMIT\`    | Limit the number of rows.        |

\| \`AS\`       | Create an alias.                 |

\| \`DISTINCT\` | Remove duplicate values.         |

\---

\# Aggregation Functions

**\*\*Aggregation functions\*\*** perform calculations on multiple rows and return a single result or a result for each group.

Common aggregation functions:

\| Function  | Description                               | Example      |

\| --------- | ----------------------------------------- | ------------ |

\| \`COUNT()\` | Counts the number of rows or values.      | \`COUNT(\*)\`   |

\| \`SUM()\`   | Calculates the total of numeric values.   | \`SUM(price)\` |

\| \`AVG()\`   | Calculates the average of numeric values. | \`AVG(price)\` |

\| \`MIN()\`   | Finds the smallest value.                 | \`MIN(price)\` |

\| \`MAX()\`   | Finds the largest value.                  | \`MAX(price)\` |

\### Example

\`\`\`sql

SELECT category, COUNT(\*) AS total\_products

FROM products

GROUP BY category;

\`\`\`

This counts how many products exist in each category.

\---

\## Aggregation Use Cases

\### 1. Filter products greater than a certain price

\`\`\`sql

SELECT \*

FROM products

WHERE price > 100;

\`\`\`

\### 2. Search names that start with a certain letter

\`\`\`sql

SELECT \*

FROM products

WHERE name LIKE 'A%';

\`\`\`

\* \`'A%'\` → names starting with \`A\`.

\* \`%\` → represents zero or more characters.

\### 3. Count how many products are in each category

\`\`\`sql

SELECT category, COUNT(\*) AS total\_products

FROM products

GROUP BY category;

\`\`\`

\### 4. Find the most expensive item per group

\`\`\`sql

SELECT category, MAX(price) AS highest\_price

FROM products

GROUP BY category;

\`\`\`

\---

\# SQL Operators

Operators are symbols or keywords used to compare, filter, combine, and search values in SQL queries.

\## 1. Comparison Operators

Used to compare two values.

\| Operator | Meaning                  | Example        |

\| -------- | ------------------------ | -------------- |

\| \`=\`      | Equal to                 | \`price = 100\`  |

\| \`!=\`     | Not equal to             | \`price != 100\` |

\| \`<\`      | Less than                | \`price < 100\`  |

\| \`>\`      | Greater than             | \`price > 100\`  |

\| \`<=\`     | Less than or equal to    | \`price <= 100\` |

\| \`>=\`     | Greater than or equal to | \`price >= 100\` |

Example:

\`\`\`sql

SELECT \*

FROM products

WHERE price > 100;

\`\`\`

\---

\## 2. Range Operator — BETWEEN

Used to check whether a value falls within a specified range.

\`\`\`sql

SELECT \*

FROM products

WHERE price BETWEEN 100 AND 500;

\`\`\`

\* \`BETWEEN\` includes both boundary values.

\---

\## 3. Set Operator — IN

Used to check whether a value matches any value in a specified list.

\`\`\`sql

SELECT \*

FROM products

WHERE category IN ('Electronics', 'Clothing', 'Books');

\`\`\`

This is useful when checking multiple possible values.

\---

\## 4. Pattern Operator — LIKE

Used to search for a specific pattern in text.

\`\`\`sql

SELECT \*

FROM products

WHERE name LIKE 'A%';

\`\`\`

Common patterns:

\| Pattern | Meaning                                           |

\| ------- | ------------------------------------------------- |

\| \`'A%'\`  | Starts with \`A\`                                   |

\| \`'%A'\`  | Ends with \`A\`                                     |

\| \`'%A%'\` | Contains \`A\`                                      |

\| \`'A\_'\`  | Starts with \`A\` followed by exactly one character |

\---

\## 5. Logical Operators

Used to combine or modify conditions.

\### AND

All conditions must be true.

\`\`\`sql

SELECT \*

FROM products

WHERE price > 100

AND category = 'Electronics';

\`\`\`

\### OR

At least one condition must be true.

\`\`\`sql

SELECT \*

FROM products

WHERE category = 'Electronics'

OR category = 'Books';

\`\`\`

\### NOT

Reverses a condition.

\`\`\`sql

SELECT \*

FROM products

WHERE NOT category = 'Electronics';

\`\`\`

\---

\## Quick Operator Reference

\| Category   | Operators                       | Purpose                       |

\| ---------- | ------------------------------- | ----------------------------- |

\| Comparison | \`=\`, \`!=\`, \`<\`, \`>\`, \`<=\`, \`>=\` | Compare values                |

\| Range      | \`BETWEEN\`                       | Check a value within a range  |

\| Set        | \`IN\`                            | Match against multiple values |

\| Pattern    | \`LIKE\`                          | Search text patterns          |

\| Logical    | \`AND\`, \`OR\`, \`NOT\`              | Combine or reverse conditions |

\`\`\`

---

# String Functions

String functions are used to manipulate, format, search, and transform text values in PostgreSQL.

## String Functions Reference

| Function | Description | Example |
| --- | --- | --- |
| `LOWER(text)` | Converts text to lowercase. | `'LAPTOP'` → `'laptop'` |
| `UPPER(text)` | Converts text to uppercase. | `'mouse'` → `'MOUSE'` |
| `LENGTH(text)` | Returns the number of characters in a string. | `'Laptop'` → `6` |
| `SUBSTRING(text, start, length)` | Extracts a part of a string. | `'Notebook'` → `'Note'` |
| `LEFT(text, n)` | Gets the left-most `n` characters. | `'Notebook'` → `'Note'` |
| `RIGHT(text, n)` | Gets the right-most `n` characters. | `'Notebook'` → `'book'` |
| `CONCAT(str1, str2, ...)` | Joins two or more strings together. | `'Sheryians'` + `'AI'` → `'SheryiansAI'` |
| `TRIM(text)` | Removes spaces from the beginning and end of a string. | `' Hello '` → `'Hello'` |
| `REPLACE(text, from, to)` | Replaces part of a string with another string. | `'USB-C'` → `'USB'` |

## Examples

### 1. LOWER()

Converts text to lowercase.

```sql
SELECT LOWER(name)
FROM products;
```

Example:

```text
'LAPTOP' → 'laptop'
```

### 2. UPPER()

Converts text to uppercase.

```sql
SELECT UPPER(category)
FROM products;
```

Example:

```text
'mouse' → 'MOUSE'
```

### 3. LENGTH()

Returns the number of characters in a string.

```sql
SELECT name, LENGTH(name) AS name_length
FROM products;
```

Example:

```text
'Laptop' → 6
```

### 4. SUBSTRING()

Extracts a specific part of a string.

```sql
SELECT SUBSTRING(name, 1, 4)
FROM products;
```

Example:

```text
'Notebook' → 'Note'
```

### 5. LEFT()

Returns the first `n` characters from the left.

```sql
SELECT LEFT(name, 4)
FROM products;
```

Example:

```text
'Notebook' → 'Note'
```

### 6. RIGHT()

Returns the last `n` characters from the right.

```sql
SELECT RIGHT(name, 4)
FROM products;
```

Example:

```text
'Notebook' → 'book'
```

### 7. CONCAT()

Combines multiple strings.

```sql
SELECT CONCAT(name, ' - ', category) AS product_info
FROM products;
```

Example:

```text
'Laptop' + ' - ' + 'Electronics'
→ 'Laptop - Electronics'
```

### 8. TRIM()

Removes whitespace from the beginning and end of a string.

```sql
SELECT TRIM(name)
FROM products;
```

Example:

```text
'  Laptop  ' → 'Laptop'
```

### 9. REPLACE()

Replaces every occurrence of one substring with another.

```sql
SELECT REPLACE(name, 'Phone', 'Mobile')
FROM products;
```

Example:

```text
'Smart Phone' → 'Smart Mobile'
```

## Important Notes

- String functions are commonly used with `SELECT`, `WHERE`, `ORDER BY`, and `GROUP BY`.
- `LOWER()` and `UPPER()` are useful when you want consistent text formatting.
- `LENGTH()` counts the number of characters in the string.
- `SUBSTRING()` uses a starting position and length. PostgreSQL string positions start at `1`.
- `LEFT()` and `RIGHT()` are convenient when you only need characters from one side of a string.
- `CONCAT()` is useful for combining columns and text. It is generally safer than using the `||` operator when `NULL` values may be present.
- `TRIM()` removes whitespace at the beginning and end, not spaces in the middle of a string.
- `REPLACE()` replaces matching occurrences throughout the string.
- PostgreSQL also provides `CONCAT_WS()` for concatenating values with a separator.

### Useful PostgreSQL Examples

Convert categories to uppercase and return only unique values:

```sql
SELECT DISTINCT UPPER(category) AS category
FROM products
ORDER BY category DESC;
```

Search for products whose names contain a word after converting to lowercase:

```sql
SELECT *
FROM products
WHERE LOWER(name) LIKE '%phone%';
```

Create a formatted product label:

```sql
SELECT CONCAT(UPPER(category), ': ', name) AS product_label
FROM products;
```

Remove unwanted spaces before comparing text:

```sql
SELECT *
FROM products
WHERE TRIM(name) = 'Laptop';
```

---

