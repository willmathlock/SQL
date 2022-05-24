DROP TABLE users;
CREATE TABLE users(
    user_id NUMBER,
    username VARCHAR2(50 CHAR) UNIQUE NOT NULL,
    first_name VARCHAR2(50 CHAR),
    last_name VARCHAR2(50 CHAR),
    account_balance NUMBER DEFAULT 0,
    CONSTRAINT users_pk PRIMARY KEY(user_id)
);
CREATE TABLE projects(
    project_id NUMBER NOT NULL,
    project_title VARCHAR2(50) UNIQUE,
    creator_id NUMBER NOT NULL REFERENCES users(user_id),
    CONSTRAINT projects_pk PRIMARY KEY(project_id)
);