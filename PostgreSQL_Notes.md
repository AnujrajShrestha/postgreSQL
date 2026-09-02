# PostgreSQL

## Basic CRUD Operations

CRUD stands for **Create, Read, Update, and Delete**.

```sql
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

SELECT * FROM students;

UPDATE students 
SET age = 24 
WHERE name = 'Aastha';

DELETE FROM students 
WHERE name = 'Anuj';
```

---

# PostgreSQL Data Types

| Data Type          | Description                                                                                             | Example                     |
| ------------------ | ------------------------------------------------------------------------------------------------------- | --------------------------- |
| `SMALLINT`         | Integer with a smaller range; useful for small numbers such as age or class.                            | `age SMALLINT`              |
| `INT` / `INTEGER`  | Standard integer type for whole numbers.                                                                | `id INT`                    |
| `BIGINT`           | Integer type for very large whole numbers.                                                              | `population BIGINT`         |
| `NUMERIC(p,s)`     | Exact numeric type; useful when precision is important. `p` = total digits, `s` = digits after decimal. | `price NUMERIC(10,2)`       |
| `REAL`             | Single-precision floating-point number.                                                                 | `temperature REAL`          |
| `DOUBLE PRECISION` | Double-precision floating-point number with more precision than `REAL`.                                 | `latitude DOUBLE PRECISION` |
| `SERIAL`           | PostgreSQL shorthand for an integer column backed by a sequence.                                        | `id SERIAL PRIMARY KEY`     |
| `CHAR(n)`          | Fixed-length character string. Values shorter than `n` are blank-padded.                                | `code CHAR(5)`              |
| `VARCHAR(n)`       | Variable-length character string with a maximum length.                                                 | `name VARCHAR(50)`          |
| `TEXT`             | Variable-length text without a specified maximum length.                                                | `description TEXT`          |
| `BOOLEAN`          | Stores `TRUE` or `FALSE`.                                                                               | `is_active BOOLEAN`         |
| `DATE`             | Stores a date without a time.                                                                           | `birth_date DATE`           |
| `TIME`             | Stores a time of day without a date.                                                                    | `start_time TIME`           |
| `TIMESTAMP`        | Stores date and time without timezone information.                                                      | `created_at TIMESTAMP`      |
| `TIMESTAMPTZ`      | Stores an absolute date/time value with timezone handling.                                              | `created_at TIMESTAMPTZ`    |
| `INTERVAL`         | Stores a duration or amount of time.                                                                    | `duration INTERVAL`         |

> **Note:** `SERIAL` is PostgreSQL-specific shorthand that creates an integer column backed by a sequence. For newer PostgreSQL designs, identity columns such as `GENERATED ALWAYS AS IDENTITY` are generally preferred.

---

# PostgreSQL Constraints

Constraints are rules applied to table columns to maintain data integrity.

| Constraint    | Description                                     | Example                              |
| ------------- | ----------------------------------------------- | ------------------------------------ |
| `PRIMARY KEY` | Uniquely identifies each row.                   | `id INT PRIMARY KEY`                 |
| `NOT NULL`    | Column must have a value.                       | `name TEXT NOT NULL`                 |
| `UNIQUE`      | Prevents duplicate values.                      | `email TEXT UNIQUE`                  |
| `DEFAULT`     | Provides a default value when none is supplied. | `created_at TIMESTAMP DEFAULT now()` |
| `CHECK`       | Validates values using a condition.             | `age INT CHECK (age > 18)`           |
| `FOREIGN KEY` | Links one table to another.                     | `user_id INT REFERENCES users(id)`   |

---

# Basic SQL Notes

## Create Database

```sql
CREATE DATABASE students;
```

Creates a new database named `students`.

> **Note:** `CREATE DATABASE` is a DDL command, not part of CRUD.

---

## Create Table

```sql
CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age SMALLINT,
    class SMALLINT
);
```

* `PRIMARY KEY` uniquely identifies each row.
* `VARCHAR(50)` allows a variable-length string up to 50 characters.
* `SMALLINT` is suitable for relatively small whole numbers.

---

## Insert Data

```sql
INSERT INTO students (id, name, age, class)
VALUES
    (1, 'Anuj', 19, 12),
    (2, 'Aastha', 23, 15);
```

Adds one or more rows to a table.

---

## Select Data

```sql
SELECT * FROM students;
```

Returns all columns and rows from the `students` table.

### Useful Variations

```sql
SELECT name, age
FROM students;
```

```sql
SELECT *
FROM students
WHERE age > 18;
```

---

## Update Data

```sql
UPDATE students
SET age = 24
WHERE name = 'Aastha';
```

Changes existing data.

> **Important:** Always use a `WHERE` condition when you only want to update specific rows. Without `WHERE`, all rows can be updated.

---

## Delete Data

```sql
DELETE FROM students
WHERE name = 'Anuj';
```

Deletes rows matching the condition.

> **Important:** `DELETE FROM students;` without a `WHERE` condition deletes all rows from the table.

---

# Quick CRUD Reference

| Operation | SQL Command                    |
| --------- | ------------------------------ |
| Create    | `INSERT INTO ...`              |
| Read      | `SELECT ...`                   |
| Update    | `UPDATE ... SET ... WHERE ...` |
| Delete    | `DELETE FROM ... WHERE ...`    |

> **Note:** `CREATE DATABASE` and `CREATE TABLE` are DDL commands. CRUD's "Create" refers to creating/inserting records with `INSERT`.

---

# SQL Clauses Overview

SQL clauses are keywords used to retrieve, filter, group, sort, and limit data.

| Clause     | Description                            |
| ---------- | -------------------------------------- |
| `SELECT`   | Choose which columns to display.       |
| `FROM`     | Specify the table.                     |
| `WHERE`    | Filter rows based on a condition.      |
| `GROUP BY` | Group rows for aggregation.            |
| `HAVING`   | Filter aggregated groups.              |
| `ORDER BY` | Sort the result.                       |
| `LIMIT`    | Limit the number of rows returned.     |
| `AS`       | Create an alias for columns or tables. |
| `DISTINCT` | Return only unique values.             |

---

# SQL Clauses

## 1. SELECT

Used to specify which columns you want to retrieve.

```sql
SELECT name, price
FROM products;
```

* `SELECT *` → returns all columns.
* `SELECT name, price` → returns only the specified columns.

---

## 2. FROM

Specifies the table from which the data is retrieved.

```sql
SELECT *
FROM products;
```

* `FROM products` → retrieves data from the `products` table.

---

## 3. WHERE

Used to filter rows based on a condition.

```sql
SELECT *
FROM products
WHERE category = 'Electronics';
```

Only rows satisfying the condition are returned.

Common operators:

```text
=    !=    >    <    >=    <=
```

---

## 4. GROUP BY

Groups rows that have the same value in one or more columns.

```sql
SELECT category
FROM products
GROUP BY category;
```

Often used with aggregate functions such as:

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

Example:

```sql
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;
```

---

## 5. HAVING

Filters groups created by `GROUP BY`.

```sql
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 1;
```

* `WHERE` → filters individual rows.
* `HAVING` → filters grouped/aggregated results.

---

## 6. ORDER BY

Sorts the result based on one or more columns.

```sql
SELECT *
FROM products
ORDER BY price ASC;
```

* `ASC` → ascending order.
* `DESC` → descending order.

Example:

```sql
SELECT *
FROM products
ORDER BY price DESC;
```

---

## 7. LIMIT

Limits the number of rows returned.

```sql
SELECT *
FROM products
LIMIT 3;
```

Returns only the first 3 rows.

---

## 8. AS

Creates a temporary alias for a column or table.

```sql
SELECT
    name AS item_name,
    price AS item_price
FROM products;
```

* Makes output column names easier to understand.
* Does not change the original column name.

---

## 9. DISTINCT

Removes duplicate values from the result.

```sql
SELECT DISTINCT category
FROM products;
```

Returns each category only once.

---

# SQL Clause Order

A typical SQL query follows this structure:

```sql
SELECT DISTINCT column
FROM table
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column
LIMIT number;
```

### Example

```sql
SELECT
    category,
    COUNT(*) AS total_products
FROM products
WHERE price > 100
GROUP BY category
HAVING COUNT(*) > 1
ORDER BY total_products DESC
LIMIT 3;
```

---

# Quick Clause Reference

| Clause     | Purpose                          |
| ---------- | -------------------------------- |
| `SELECT`   | Choose columns to display.       |
| `FROM`     | Specify the table.               |
| `WHERE`    | Filter individual rows.          |
| `GROUP BY` | Group rows with the same values. |
| `HAVING`   | Filter grouped results.          |
| `ORDER BY` | Sort the result.                 |
| `LIMIT`    | Limit the number of rows.        |
| `AS`       | Create an alias.                 |
| `DISTINCT` | Remove duplicate values.         |

---

# Aggregation Functions

Aggregate functions perform calculations on multiple rows and return a single result or a result for each group.

| Function  | Description                               | Example      |
| --------- | ----------------------------------------- | ------------ |
| `COUNT()` | Counts rows or non-null values.           | `COUNT(*)`   |
| `SUM()`   | Calculates the total of numeric values.   | `SUM(price)` |
| `AVG()`   | Calculates the average of numeric values. | `AVG(price)` |
| `MIN()`   | Finds the smallest value.                 | `MIN(price)` |
| `MAX()`   | Finds the largest value.                  | `MAX(price)` |

### Example

```sql
SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category;
```

Counts how many products exist in each category.

---

## Aggregation Examples

### Count Products

```sql
SELECT COUNT(*) AS total_products
FROM products;
```

### Calculate Total Price

```sql
SELECT SUM(price) AS total_price
FROM products;
```

### Calculate Average Price

```sql
SELECT AVG(price) AS average_price
FROM products;
```

### Find Cheapest Product Price

```sql
SELECT MIN(price) AS lowest_price
FROM products;
```

### Find Most Expensive Product Price

```sql
SELECT MAX(price) AS highest_price
FROM products;
```

### Find Highest Price Per Category

```sql
SELECT
    category,
    MAX(price) AS highest_price
FROM products
GROUP BY category;
```

---

# Filtering and Pattern Matching Examples

## Products Greater Than a Certain Price

```sql
SELECT *
FROM products
WHERE price > 100;
```

## Names Starting With a Certain Letter

```sql
SELECT *
FROM products
WHERE name LIKE 'A%';
```

* `'A%'` → starts with `A`.
* `%` → represents zero or more characters.

---

# SQL Operators

Operators are symbols or keywords used to compare, filter, combine, and search values.

## 1. Comparison Operators

| Operator | Meaning                  | Example        |
| -------- | ------------------------ | -------------- |
| `=`      | Equal to                 | `price = 100`  |
| `!=`     | Not equal to             | `price != 100` |
| `<`      | Less than                | `price < 100`  |
| `>`      | Greater than             | `price > 100`  |
| `<=`     | Less than or equal to    | `price <= 100` |
| `>=`     | Greater than or equal to | `price >= 100` |

Example:

```sql
SELECT *
FROM products
WHERE price > 100;
```

---

## 2. BETWEEN

Used to check whether a value falls within a specified range.

```sql
SELECT *
FROM products
WHERE price BETWEEN 100 AND 500;
```

> `BETWEEN` includes both boundary values.

The above is equivalent to:

```sql
WHERE price >= 100 AND price <= 500
```

---

## 3. IN

Used to check whether a value matches any value in a specified list.

```sql
SELECT *
FROM products
WHERE category IN ('Electronics', 'Clothing', 'Books');
```

This is useful when checking multiple possible values.

---

## 4. LIKE

Used to search for a specific pattern in text.

```sql
SELECT *
FROM products
WHERE name LIKE 'A%';
```

### Common Patterns

| Pattern | Meaning                                           |
| ------- | ------------------------------------------------- |
| `'A%'`  | Starts with `A`                                   |
| `'%A'`  | Ends with `A`                                     |
| `'%A%'` | Contains `A`                                      |
| `'A_'`  | Starts with `A` followed by exactly one character |

---

## 5. ILIKE

PostgreSQL provides `ILIKE` for case-insensitive pattern matching.

```sql
SELECT *
FROM products
WHERE name ILIKE 'phone%';
```

This can match values such as:

```text
Phone
PHONE
phone
Phone Case
```

---

## 6. Logical Operators

### AND

All conditions must be true.

```sql
SELECT *
FROM products
WHERE price > 100
AND category = 'Electronics';
```

### OR

At least one condition must be true.

```sql
SELECT *
FROM products
WHERE category = 'Electronics'
OR category = 'Books';
```

### NOT

Reverses a condition.

```sql
SELECT *
FROM products
WHERE NOT category = 'Electronics';
```

---

## 7. NULL Operators

`NULL` represents a missing or unknown value.

You should **not** use:

```sql
WHERE name = NULL;
```

Instead, use `IS NULL`:

```sql
SELECT *
FROM products
WHERE name IS NULL;
```

To find values that are not `NULL`:

```sql
SELECT *
FROM products
WHERE name IS NOT NULL;
```

---

# Quick Operator Reference

| Category   | Operators                       | Purpose                       |
| ---------- | ------------------------------- | ----------------------------- |
| Comparison | `=`, `!=`, `<`, `>`, `<=`, `>=` | Compare values                |
| Range      | `BETWEEN`                       | Check a value within a range  |
| Set        | `IN`                            | Match against multiple values |
| Pattern    | `LIKE`, `ILIKE`                 | Search text patterns          |
| Logical    | `AND`, `OR`, `NOT`              | Combine or reverse conditions |
| NULL       | `IS NULL`, `IS NOT NULL`        | Check missing values          |

---

# String Functions

String functions are used to manipulate, format, search, and transform text values in PostgreSQL.

## String Functions Reference

| Function                         | Description                                | Example                                     |
| -------------------------------- | ------------------------------------------ | ------------------------------------------- |
| `LOWER(text)`                    | Converts text to lowercase.                | `'LAPTOP'` → `'laptop'`                     |
| `UPPER(text)`                    | Converts text to uppercase.                | `'mouse'` → `'MOUSE'`                       |
| `LENGTH(text)`                   | Returns the number of characters.          | `'Laptop'` → `6`                            |
| `SUBSTRING(text, start, length)` | Extracts part of a string.                 | `'Notebook'` → `'Note'`                     |
| `LEFT(text, n)`                  | Gets the left-most `n` characters.         | `'Notebook'` → `'Note'`                     |
| `RIGHT(text, n)`                 | Gets the right-most `n` characters.        | `'Notebook'` → `'book'`                     |
| `CONCAT(str1, str2, ...)`        | Joins multiple strings.                    | `'Hello'` + `' World'` → `'Hello World'`    |
| `CONCAT_WS(separator, ...)`      | Joins strings using a separator.           | `CONCAT_WS(' - ', 'Laptop', 'Electronics')` |
| `TRIM(text)`                     | Removes spaces from the beginning and end. | `' Hello '` → `'Hello'`                     |
| `REPLACE(text, from, to)`        | Replaces matching text.                    | `'USB-C'` → `'USB'`                         |

---

## 1. LOWER()

Converts text to lowercase.

```sql
SELECT LOWER(name)
FROM products;
```

Example:

```text
'LAPTOP' → 'laptop'
```

---

## 2. UPPER()

Converts text to uppercase.

```sql
SELECT UPPER(category)
FROM products;
```

Example:

```text
'mouse' → 'MOUSE'
```

---

## 3. LENGTH()

Returns the number of characters in a string.

```sql
SELECT
    name,
    LENGTH(name) AS name_length
FROM products;
```

Example:

```text
'Laptop' → 6
```

---

## 4. SUBSTRING()

Extracts a specific part of a string.

```sql
SELECT SUBSTRING(name, 1, 4)
FROM products;
```

Example:

```text
'Notebook' → 'Note'
```

> PostgreSQL string positions start at `1`.

---

## 5. LEFT()

Returns the first `n` characters from the left.

```sql
SELECT LEFT(name, 4)
FROM products;
```

Example:

```text
'Notebook' → 'Note'
```

---

## 6. RIGHT()

Returns the last `n` characters from the right.

```sql
SELECT RIGHT(name, 4)
FROM products;
```

Example:

```text
'Notebook' → 'book'
```

---

## 7. CONCAT()

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

`CONCAT()` treats `NULL` arguments as empty strings.

---

## 8. CONCAT_WS()

Combines strings using a separator.

```sql
SELECT CONCAT_WS(' - ', name, category) AS product_info
FROM products;
```

Example:

```text
Laptop - Electronics
```

`WS` means **With Separator**.

---

## 9. TRIM()

Removes whitespace from the beginning and end of a string.

```sql
SELECT TRIM(name)
FROM products;
```

Example:

```text
'  Laptop  ' → 'Laptop'
```

> `TRIM()` does not remove spaces from the middle of a string.

---

## 10. REPLACE()

Replaces matching occurrences of one substring with another.

```sql
SELECT REPLACE(name, 'Phone', 'Mobile')
FROM products;
```

Example:

```text
'Smart Phone' → 'Smart Mobile'
```

---

# String Function Examples

## Convert Categories to Uppercase

```sql
SELECT DISTINCT
    UPPER(category) AS category_name
FROM products
ORDER BY category_name DESC;
```

## Search Names Case-Insensitively

```sql
SELECT *
FROM products
WHERE LOWER(name) LIKE '%phone%';
```

Or, using PostgreSQL's `ILIKE`:

```sql
SELECT *
FROM products
WHERE name ILIKE '%phone%';
```

## Create a Formatted Product Label

```sql
SELECT
    CONCAT(UPPER(category), ': ', name) AS product_label
FROM products;
```

Example:

```text
ELECTRONICS: Laptop
```

## Remove Unwanted Spaces

```sql
SELECT *
FROM products
WHERE TRIM(name) = 'Laptop';
```

---

# Important String Function Notes

* `LOWER()` converts text to lowercase.
* `UPPER()` converts text to uppercase.
* `LENGTH()` returns the number of characters.
* `SUBSTRING()` extracts part of a string.
* PostgreSQL string positions start at `1`.
* `LEFT()` gets characters from the beginning.
* `RIGHT()` gets characters from the end.
* `CONCAT()` combines multiple values.
* `CONCAT_WS()` combines values using a separator.
* `TRIM()` removes leading and trailing whitespace.
* `REPLACE()` replaces matching text.
* `LIKE` performs pattern matching.
* `ILIKE` performs case-insensitive pattern matching in PostgreSQL.
* `IS NULL` and `IS NOT NULL` should be used when checking for `NULL`.
* String functions can be used with `SELECT`, `WHERE`, `ORDER BY`, and other SQL clauses.

---

# Quick String Function Reference

| Function      | Purpose                            |
| ------------- | ---------------------------------- |
| `LOWER()`     | Convert text to lowercase          |
| `UPPER()`     | Convert text to uppercase          |
| `LENGTH()`    | Count characters                   |
| `SUBSTRING()` | Extract part of a string           |
| `LEFT()`      | Get characters from the left       |
| `RIGHT()`     | Get characters from the right      |
| `CONCAT()`    | Combine strings                    |
| `CONCAT_WS()` | Combine strings with a separator   |
| `TRIM()`      | Remove leading/trailing whitespace |
| `REPLACE()`   | Replace matching text              |

---

---


# ALTER TABLE Operations

`ALTER TABLE` is a **DDL command** used to modify the structure of an existing table.

It can be used to add, remove, rename, or modify columns, add/remove constraints, and rename tables.

---

## 1. Add a Column

Use `ADD COLUMN` to add a new column to an existing table.

```sql
ALTER TABLE students
ADD COLUMN email VARCHAR(100) DEFAULT 'not provided';
```

* Adds a new `email` column to the `students` table.
* `DEFAULT 'not provided'` gives the column a default value.

---

## 2. Drop a Column

Use `DROP COLUMN` to permanently remove a column from a table.

```sql
ALTER TABLE students
DROP COLUMN email;
```

> **Important:** Dropping a column also removes the data stored in that column.

---

## 3. Rename a Column

Use `RENAME COLUMN` to change the name of an existing column.

```sql
ALTER TABLE students
RENAME COLUMN name TO full_name;
```

* Changes `name` to `full_name`.
* The data inside the column is preserved.

---

## 4. Change the Data Type of a Column

Use `ALTER COLUMN ... TYPE` to change a column's data type.

```sql
ALTER TABLE students
ALTER COLUMN age TYPE SMALLINT;
```

> **Note:** The existing data must be compatible with the new data type. PostgreSQL may require a `USING` expression for some conversions.

---

## 5. Set a Default Value

Use `SET DEFAULT` to define a default value for a column.

```sql
ALTER TABLE students
ALTER COLUMN age SET DEFAULT 18;
```

If a new row is inserted without specifying `age`, PostgreSQL uses `18`.

```sql
INSERT INTO students (id, full_name, class)
VALUES (3, 'Ram', 12);
```

---

## 6. Remove a Default Value

Use `DROP DEFAULT` to remove the default value from a column.

```sql
ALTER TABLE students
ALTER COLUMN age DROP DEFAULT;
```

This does **not** delete existing values. It only removes the default used for future inserts.

---

## 7. Add a Constraint

Use `ADD CONSTRAINT` to add a rule to an existing table.

```sql
ALTER TABLE students
ADD CONSTRAINT age_check CHECK (age >= 0);
```

* `age_check` is the name of the constraint.
* `CHECK (age >= 0)` ensures that `age` cannot be negative.

---

## 8. Drop a Constraint

Use `DROP CONSTRAINT` to remove an existing constraint.

```sql
ALTER TABLE students
DROP CONSTRAINT age_check;
```

The constraint must be identified by its name.

---

## 9. Rename a Table

Use `RENAME TO` to change the name of an existing table.

```sql
ALTER TABLE students
RENAME TO school_students;
```

The table is now named `school_students`.

```sql
SELECT *
FROM school_students;
```

---

# ALTER TABLE Syntax Reference

| Operation | Syntax |
| --------- | ------ |
| Add column | `ALTER TABLE table_name ADD COLUMN column_name data_type;` |
| Drop column | `ALTER TABLE table_name DROP COLUMN column_name;` |
| Rename column | `ALTER TABLE table_name RENAME COLUMN old_name TO new_name;` |
| Change data type | `ALTER TABLE table_name ALTER COLUMN column_name TYPE data_type;` |
| Set default | `ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT value;` |
| Drop default | `ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT;` |
| Add constraint | `ALTER TABLE table_name ADD CONSTRAINT constraint_name condition;` |
| Drop constraint | `ALTER TABLE table_name DROP CONSTRAINT constraint_name;` |
| Rename table | `ALTER TABLE table_name RENAME TO new_table_name;` |

---

# Important ALTER TABLE Notes

* `ALTER TABLE` modifies the **structure/schema** of an existing table.
* `ALTER TABLE` is a **DDL command**.
* `ADD COLUMN` adds a new column.
* `DROP COLUMN` permanently removes a column and its stored data.
* `RENAME COLUMN` changes a column's name without removing its data.
* `ALTER COLUMN ... TYPE` changes a column's data type.
* `SET DEFAULT` affects future inserts; it does not automatically change existing rows.
* `DROP DEFAULT` removes the default value but does not remove existing data.
* `ADD CONSTRAINT` adds a data-integrity rule.
* `DROP CONSTRAINT` removes a previously defined constraint.
* `RENAME TO` changes the table name.
* Use meaningful names for constraints so they are easy to identify and remove later.

---

# Quick ALTER TABLE Reference

| Command | Purpose |
| ------- | ------- |
| `ADD COLUMN` | Add a new column |
| `DROP COLUMN` | Remove a column |
| `RENAME COLUMN` | Rename a column |
| `ALTER COLUMN ... TYPE` | Change a column's data type |
| `SET DEFAULT` | Set a default value |
| `DROP DEFAULT` | Remove a default value |
| `ADD CONSTRAINT` | Add a constraint |
| `DROP CONSTRAINT` | Remove a constraint |
| `RENAME TO` | Rename a table |

---

# CASE Expression

`CASE` is a conditional expression in PostgreSQL. It works similarly to an **if-else** or **switch** statement in programming languages.

It allows you to return different values based on different conditions within a single SQL query.

## Uses of CASE

1. Create custom columns on the fly.
2. Categorize data based on specific conditions.
3. Handle `NULL` or missing values gracefully.
4. Simplify conditional logic inside `SELECT`, `UPDATE`, and other SQL statements.

---

## CASE Syntax

```sql
SELECT column1,

    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE default_result
    END AS new_column_name

FROM table_name;
```

### How it works

* `WHEN` → specifies a condition.
* `THEN` → specifies the value returned when the condition is true.
* `ELSE` → specifies the value returned when none of the conditions are true.
* `END` → marks the end of the `CASE` expression.
* `AS` → gives the calculated column a name.

> **Note:** The `ELSE` clause is optional. If it is omitted and no condition matches, PostgreSQL returns `NULL`.

---

## 1. Categorize Products by Price

Suppose:

* Price above `1000` → **Expensive**
* Price between `500` and `1000` → **Moderate**
* Price below `500` → **Cheap**

```sql
SELECT
    name,
    price,

    CASE
        WHEN price > 1000 THEN 'Expensive'
        WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
        ELSE 'Cheap'
    END AS price_tag

FROM products;
```

### Example Result

| name     | price | price_tag |
| -------- | ----: | --------- |
| Laptop   |  1500 | Expensive |
| Keyboard |   750 | Moderate  |
| Mouse    |   300 | Cheap     |

> **Note:** `BETWEEN 500 AND 1000` includes both `500` and `1000`.

---

## 2. Store CASE Result in a Column

You can also use `CASE` inside an `UPDATE` statement to permanently store the calculated result.

### Add the Column

```sql
ALTER TABLE products
ADD COLUMN price_tag VARCHAR(10);
```

### Update the Column

```sql
UPDATE products
SET price_tag =
    CASE
        WHEN price > 1000 THEN 'Expensive'
        WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
        ELSE 'Cheap'
    END;
```

Now the `price_tag` value is stored in the table.

```sql
SELECT name, price, price_tag
FROM products;
```

> **Important:** A `CASE` expression inside a `SELECT` creates a result dynamically. Using it inside `UPDATE` stores the resulting value in the table.

---

## 3. Check Product Availability

`CASE` can be used with a `BOOLEAN` column to create a more readable status.

```sql
SELECT
    name,

    CASE
        WHEN is_available THEN 'In Stock'
        ELSE 'Out Of Stock'
    END AS availability_status

FROM products;
```

If `is_available` is `TRUE`, the result is:

```text
In Stock
```

If `is_available` is `FALSE`, the result is:

```text
Out Of Stock
```

---

## 4. Categorize Products by Stock Quantity

Suppose:

* Quantity greater than `100` → **High Stock**
* Quantity between `40` and `100` → **Medium Stock**
* Otherwise → **Low Stock**

```sql
SELECT
    name,
    quantity,

    CASE
        WHEN quantity > 100 THEN 'High Stock'
        WHEN quantity BETWEEN 40 AND 100 THEN 'Medium Stock'
        ELSE 'Low Stock'
    END AS stock_level

FROM products;
```

### Example Result

| name     | quantity | stock_level  |
| -------- | -------: | ------------ |
| Laptop   |      150 | High Stock   |
| Keyboard |       75 | Medium Stock |
| Mouse    |       20 | Low Stock    |

---

## CASE with NULL Values

`CASE` can also be used to handle `NULL` values.

```sql
SELECT
    name,

    CASE
        WHEN price IS NULL THEN 'Price Not Available'
        ELSE 'Price Available'
    END AS price_status

FROM products;
```

You can also use `COALESCE()` when you simply want to replace a `NULL` value:

```sql
SELECT
    name,
    COALESCE(price::TEXT, 'Price Not Available') AS price
FROM products;
```

---

## CASE with ORDER BY

`CASE` can be used to create a custom sorting order.

For example, sort products in this order:

1. High Stock
2. Medium Stock
3. Low Stock

```sql
SELECT
    name,
    quantity,

    CASE
        WHEN quantity > 100 THEN 'High Stock'
        WHEN quantity BETWEEN 40 AND 100 THEN 'Medium Stock'
        ELSE 'Low Stock'
    END AS stock_level

FROM products

ORDER BY
    CASE
        WHEN quantity > 100 THEN 1
        WHEN quantity BETWEEN 40 AND 100 THEN 2
        ELSE 3
    END;
```

This is useful when normal alphabetical or numerical sorting is not what you want.

---

## CASE with Aggregate Functions

`CASE` can also be combined with aggregate functions such as `COUNT()` and `SUM()`.

### Count Available Products

```sql
SELECT
    COUNT(
        CASE
            WHEN is_available THEN 1
        END
    ) AS available_products

FROM products;
```

### Count Expensive Products

```sql
SELECT
    COUNT(
        CASE
            WHEN price > 1000 THEN 1
        END
    ) AS expensive_products

FROM products;
```

---

# Important CASE Notes

* `CASE` is a **conditional expression**, not a separate SQL statement.
* It works similarly to `if-else` or `switch` logic.
* `WHEN` defines a condition.
* `THEN` defines the result when the condition is true.
* `ELSE` provides a default result.
* `END` marks the end of the `CASE` expression.
* `AS` can be used to give the calculated result a column alias.
* Conditions are evaluated from **top to bottom**.
* Once a `WHEN` condition is true, PostgreSQL returns its corresponding `THEN` result.
* `ELSE` is optional.
* If no condition matches and there is no `ELSE`, the result is `NULL`.
* `CASE` can be used in `SELECT`, `UPDATE`, `ORDER BY`, aggregate expressions, and other SQL expressions.
* `CASE` is useful for categorizing and transforming data without changing the original table structure.
* `CASE` can work with numbers, strings, booleans, dates, and other PostgreSQL data types.
* `BETWEEN` includes both boundary values.

---

# Quick CASE Reference

| Syntax | Purpose                                     |
| ------ | ------------------------------------------- |
| `CASE` | Starts the conditional expression           |
| `WHEN` | Defines a condition                         |
| `THEN` | Returns a result when the condition is true |
| `ELSE` | Returns a default result                    |
| `END`  | Ends the `CASE` expression                  |
| `AS`   | Gives the calculated result an alias        |

### Basic Example

```sql
SELECT
    name,
    price,

    CASE
        WHEN price > 1000 THEN 'Expensive'
        WHEN price >= 500 THEN 'Moderate'
        ELSE 'Cheap'
    END AS price_category

FROM products;
```

> **Tip:** Put the most specific conditions first because PostgreSQL evaluates `WHEN` conditions from top to bottom.
---

# PostgreSQL Relationships

In a **relational database**, data is stored across multiple tables, and these tables are connected through **relationships**.

Instead of repeating the same data again and again in one huge table, we split the data into smaller, meaningful tables and connect them using **keys** such as **Primary Keys** and **Foreign Keys**.

## Types of Relationships

There are three common types of relationships in a relational database:

1. **One-to-One (1:1)**
2. **One-to-Many (1:N)**
3. **Many-to-Many (M:N)**

---

# 1. One-to-One (1:1)

In a **One-to-One relationship**, one record in Table A is related to only one record in Table B, and vice versa.

### Example: Students and Student Profiles

| `students`  | `student_profiles`    |
| ----------- | --------------------- |
| student_id  | student_id            |
| 1 — Anuj    | 1 — Anuj's Profile    |
| 2 — Aastha  | 2 — Aastha's Profile  |
| 3 — Sandesh | 3 — Sandesh's Profile |

One student has one profile, and one profile belongs to one student.

### PostgreSQL Example

```sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE student_profiles (
    student_id INT PRIMARY KEY,
    address TEXT,
    age SMALLINT,
    phone VARCHAR(15),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);
```

Here, `student_id` in `student_profiles` is both:

* **PRIMARY KEY** → ensures each student has only one profile.
* **FOREIGN KEY** → connects the profile to the `students` table.

### Relationship

```text
students
   │
   │ 1
   │
   │
   │ 1
   ▼
student_profiles
```

---

# 2. One-to-Many (1:N)

In a **One-to-Many relationship**, one record in Table A can be related to many records in Table B.

However, each record in Table B is usually related to only one record in Table A.

### Example: Departments and Employees

| `departments` | `employees` |
| ------------- | ----------- |
| department_id | employee_id |
| 1 — IT        | 1 — Anuj    |
| 2 — HR        | 2 — Aastha  |
|               | 3 — Sandesh |

One department can have **many employees**, but an employee belongs to one department.

### PostgreSQL Example

```sql
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

Here, `department_id` is stored in the `employees` table because `employees` is the **many-side** of the relationship.

### Relationship

```text
departments
     │
     │ 1
     │
     │
     │ N
     ▼
employees
```

---

# 3. Many-to-Many (M:N)

In a **Many-to-Many relationship**, many records in Table A can be related to many records in Table B.

### Example: Students and Courses

| `students`  | `courses`      |
| ----------- | -------------- |
| 1 — Anuj    | 1 — PostgreSQL |
| 2 — Aastha  | 2 — Python     |
| 3 — Sandesh | 3 — JavaScript |

A student can enroll in **many courses**, and a course can have **many students**.

A direct foreign key is not enough to represent this relationship.

Therefore, we create a **Junction Table** (also called a **Bridge Table** or **Associative Table**).

### Junction Table

| `student_courses` |           |
| ----------------- | --------- |
| student_id        | course_id |
| 1                 | 1         |
| 1                 | 2         |
| 2                 | 1         |
| 3                 | 2         |

### PostgreSQL Example

```sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);
```

The composite primary key:

```sql
PRIMARY KEY (student_id, course_id)
```

prevents the same student from being assigned to the same course more than once.

### Relationship

```text
students              courses
    │                    │
    │ 1              1  │
    │                    │
    └── student_courses ─┘
          Junction Table
```

A many-to-many relationship is implemented using **two one-to-many relationships**:

```text
students
   │
   │ 1 : N
   ▼
student_courses
   ▲
   │ N : 1
   │
courses
```

---

# Quick Comparison

| Relationship           | Meaning         | Example                | Implementation               |
| ---------------------- | --------------- | ---------------------- | ---------------------------- |
| **One-to-One (1:1)**   | One A → One B   | Student → Profile      | Foreign Key + Primary Key    |
| **One-to-Many (1:N)**  | One A → Many B  | Department → Employees | Foreign Key on the many-side |
| **Many-to-Many (M:N)** | Many A ↔ Many B | Students ↔ Courses     | Junction Table               |

---

# Primary Key vs Foreign Key

### Primary Key

A **Primary Key (PK)** uniquely identifies each row in a table.

```sql
student_id INT PRIMARY KEY
```

Properties:

* Must be unique.
* Cannot contain `NULL`.
* Identifies a specific record.

### Foreign Key

A **Foreign Key (FK)** creates a connection between two tables.

```sql
FOREIGN KEY (student_id)
REFERENCES students(student_id)
```

It ensures that the value exists in the referenced table.

---

# Relationship Summary

```text
1. One-to-One

Student ───────── Profile
   1                  1


2. One-to-Many

Department ───────< Employees
     1                  N


3. Many-to-Many

Students >───────< Courses
             │
             ▼
      Junction Table
```

## Key Points

* **Primary Key** uniquely identifies a record.
* **Foreign Key** connects records between tables.
* **1:1** → One record is related to one record.
* **1:N** → One record is related to many records.
* **M:N** → Many records are related to many records.
* **Many-to-Many** relationships require a **Junction Table**.
* Splitting data into related tables helps reduce **data duplication** and improves **database organization**.
