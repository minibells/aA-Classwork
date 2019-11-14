PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  fname TEXT NOT NULL,
  lname TEXT NOT NULL,
  id INTEGER PRIMARY KEY
);

CREATE TABLE questions (
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,
  question_id INTEGER PRIMARY KEY,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(question_id) 
);

CREATE TABLE replies (
  reply_id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
   
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(question_id),
  FOREIGN KEY (parent_id) REFERENCES replies(reply_id)
);

CREATE TABLE question_likes (
  likes INTEGER NOT NULL,
  like_id INTEGER NOT NULL,
  liked_by INTEGER NOT NULL,

  FOREIGN KEY (like_id) REFERENCES questions(question_id),
  FOREIGN KEY (liked_by) REFERENCES users(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Tenderloin', 'The Cat'),
  ('Granola', 'The Dog'),
  ('Henry', 'The Fish');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('Why is my bowl empty?', 'I think the cat ate my food', (SELECT id FROM users WHERE fname = 'Granola'));