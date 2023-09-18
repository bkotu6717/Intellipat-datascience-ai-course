

CREATE DATABASE PROJECT_RELATIONAL_DB_DESIGN
GO

USE PROJECT_RELATIONAL_DB_DESIGN
GO
-- Create schema
CREATE TABLE user_account(
    id INTEGER PRIMARY KEY IDENTITY(1,1),
    user_name VARCHAR(100),
    email VARCHAR(254),
    [password] VARCHAR(200),
    password_salt VARCHAR(50) NOT NULL,
    password_hash_algorithm VARCHAR(50)
)
GO

CREATE TABLE role(
    id INTEGER PRIMARY KEY IDENTITY(1,1),
    role_name VARCHAR(100)
)
GO

CREATE TABLE status(
    id INTEGER PRIMARY KEY IDENTITY(1,1),
    status_name VARCHAR(100),
    is_user_working TINYINT,
    CONSTRAINT is_user_working CHECK (is_user_working>=0 AND is_user_working <= 1)
)
GO

CREATE TABLE user_has_status(
    id INTEGER PRIMARY KEY IDENTITY(1,1),
    status_start_time DATETIME,
    status_end_time DATETIME,
    user_account_id INTEGER FOREIGN KEY REFERENCES user_account(id),
    status_id INTEGER FOREIGN KEY REFERENCES status(id),
)
GO


CREATE TABLE user_has_role(
    id INTEGER PRIMARY KEY IDENTITY(1,1),
    role_start_time DATETIME,
    role_end_time DATETIME,
    user_account_id INTEGER FOREIGN KEY REFERENCES user_account(id),
    status_id INTEGER FOREIGN KEY REFERENCES status(id)
)
GO

-- 1. Insert data into each of the above tables. With at least two rows in each of
-- the tables. Make sure that you have created respective foreign keys.
INSERT INTO user_account VALUES('Bhaskar', 'bhaskar@gmail.com', 'p@ssw0rd', 'kjsfrr34fekewj240erke_sjksdfdk', 'SHA-256')
INSERT INTO user_account VALUES('Aravind', 'aravind@gmail.com', 'p@ssw0rd', 'kjsfrr34fekewj240erke_dsksdfdk', 'SHA-251')
INSERT INTO user_account VALUES('Sriram', 'sriram@gmail.com', 'p@ssw0rd', 'kjsfrr3fekewj240erke_dsjksdfdk', 'SHA-256')
INSERT INTO user_account VALUES('Devesh', 'devesh@gmail.com', 'p@ssw0rd', 'kjsfrr34feewj240erke_dsjksdfdk', 'SHA-251')
GO

INSERT INTO role VALUES('developer')
INSERT INTO role VALUES('Lead developer')
INSERT INTO role VALUES('Sr Manager')
INSERT INTO role VALUES('Manager')
INSERT INTO role VALUES('Solution Architect')
GO

INSERT INTO [status] VALUES('active', 1)
INSERT INTO [status] VALUES('dormant', 0)
INSERT INTO [status] VALUES('on vacation', 1)
GO

INSERT INTO user_has_status VALUES(GETDATE(), '2023-12-31', 1, 1)
INSERT INTO user_has_status VALUES(GETDATE(), '2023-12-30', 2, 2)
INSERT INTO user_has_status VALUES(GETDATE(), '2023-12-29', 3, 3)
GO

INSERT INTO user_has_role VALUES(GETDATE(), '2023-12-31', 1, 1)
INSERT INTO user_has_role VALUES(GETDATE(), '2023-12-30', 2, 2)
INSERT INTO user_has_role VALUES(GETDATE(), '2023-12-29', 3, 3)
GO

-- 2. Delete all the data from each of the tables.

DROP TABLE IF EXISTS user_has_status;
GO
DROP TABLE IF EXISTS user_has_role;
GO
DROP TABLE IF EXISTS user_account;
GO
DROP TABLE IF EXISTS role;
GO
DROP TABLE IF EXISTS status;
