DROP TABLE users;
DROP TABLE projects;
DROP TABLE project_users;

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
    creator_id NUMBER NOT NULL,
    CONSTRAINT projects_pk PRIMARY KEY(project_id),
    CONSTRAINT projects_users_id FOREIGN KEY(creator_id) REFERENCES users(user_id)
    ON DELETE CASCADE
);

INSERT INTO users
VALUES (11, 'urogga', 'william', 'rosa', 15);

INSERT INTO projects
VALUES (23, 'Legit Project', '11');


CREATE TABLE project_users(
    project_id NOT NULL REFERENCES projects(project_id) ON DELETE CASCADE,
    user_id NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,    
    CONSTRAINT projects_users_pk PRIMARY KEY(user_id, project_id)
);

INSERT INTO project_users
VALUES (23, 11);


SELECT * FROM users;
SELECT * FROM projects;
SELECT * FROM project_users;

DELETE FROM projects
WHERE project_id = 23;
