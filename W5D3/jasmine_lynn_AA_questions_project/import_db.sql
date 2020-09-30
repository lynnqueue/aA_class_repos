--cat import_db.sql | sqlite3 questions.db

PRAGMA foreign_keys = ON; 
--This statement makes sqlite3 actually respect the foreign key constraints 

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(26) NOT NULL,
    lname VARCHAR(26) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(250) NOT NULL,
    body VARCHAR(500) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE questions_follows (
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_id INTEGER, --self-referencing--
    user_id INTEGER NOT NULL,
    top_level BOOLEAN,
    body VARCHAR (1000) NOT NULL,

    FOREIGN KEY (parent_id) REFERENCES replies (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('alvin', 'awesome'),
    ('peter', 'kim');

INSERT INTO 
    questions (title, body, user_id)
VALUES 
    ('what''s app academy?', 'school or bootcamp?', 2),
    ('how much do I have to pay?', 'is it free?', 2);

INSERT INTO 
    replies (question_id, parent_id, user_id, top_level, body)
VALUES
    (1, NULL, 1, true, 'hey programmers, this is a bootcamp'),
    (1, 1, 2, false, 'alvin is right!');

INSERT INTO 
    question_likes (question_id, user_id)
VALUES
    (1, 2),
    (1, 1);

