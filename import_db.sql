DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULl,
  question_id INTEGER NOT NULL
);

INSERT INTO users
  (fname,lname)
VALUES
  ('Katarina','Rossi'),
  ('Ujwala','Aaduru'),
  ('Jon', 'Snow'),
  ('Daenerys', 'Targaryen');

INSERT INTO questions
  (title,body,user_id)
VALUES
  ('What is your favorite?','color',1),
  ('What is RDBMS?','sql',1),
  ('What is RSPEC','ruby',1),
  ('How do you insert into tables','using sql',2),
  ('Where are my dragons????','seriously dude', 4),
  ('Is Ghost still alive?', 'Can''t remember', 1);


INSERT INTO question_follows
    (user_id,question_id)
  VALUES
    (1, 2),
    (3, 2),
    (4, 2),
    (1, 3),
    (2, 3),
    (4, 1);


INSERT INTO replies
    (user_id,body,question_id)
  VALUES
    (2,'Black',1),
    (3, 'Presumably', 4);

    INSERT INTO replies
        (user_id,body,question_id, parent_id)
      VALUES
        (1, 'Good. Enough are already dead.', 4, 2);

INSERT INTO question_likes
    (user_id,question_id)
  VALUES
    (2,1),
    (2, 3),
    (2,2),
    (2,4),
    (3,2),
    (1, 3);
