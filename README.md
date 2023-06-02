# BD_HoqueiDB

This project consists in a database for a hockey league (1º liga Portuguesa) and a platform to manage the database. The platform is divided in two parts, one for the admin and another for the client. The admin can manage the database and the client can see the information about the league and the teams.

## How to run:

### 1. Change the SQL connection:

  1. Open the file Main_Admin.cs
  2. Change the connection string to your connection string (Between Brackets)
  ```
    return new SqlConnection("data source= <<>>;initial catalog=<<>>;uid=<<>>");
  ```
  3. Save the file
  4. The same process must be done in the file Main_Client.cs

<br />

### 2. Change the Database name to your database name in each file:
<br />

_Example_:

  ```sql
    USE (p4g7) -- Change this to your database name
    GO
  ```

<br />

### 3. Run the files in the following order:

    1. HoqueiSchema.sql
    2. SQL_DDL.sql
    3. Insertions.sql
    4. Triggers.sql
    5. Views.sql
    6. StoredProcedures.sql
    7. UDFs.sql

<br />

### 4. Restart the database
_Don't need to run SQL_DDL.sql because every time you run the file it will restart the tables_

    1. ClearSP.sql
    2. ClearUDF.sql
    3. Run the files in the following order:
        1. SQL_DDL.sql
        2. Insertions.sql
        3. Triggers.sql
        4. StoredProcedures.sql
        5. UDFs.sql

### 5. Login into platform

    1. Admin: Username: admin
              Password: 1234
    2. Client - Client account is not verified, everything is allowed


## 6. Enjoy!

<br />

## Contributors:
  - Joaquim Rosa (109089)  -- 50%
  - Hugo Correia (108215) -- 50%

  Read the final report for more information about the project (PT-PT)
