﻿CREATE DATABASE muganool;
 
USE muganool; 

CREATE TABLE users(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username varchar(32) NOT NULL UNIQUE,
  email varchar(255) NOT NULL UNIQUE,
  password varchar(255) NOT NULL,
  gender enum('m','f') NOT NULL,
  website varchar(255),
  counry varchar(255),
  userlevel enum('a','b','c','d') NOT NULL DEFAULT 'a',
  avatar varchar(255) NOT NULL,
  ip varchar(255) NOT NULL,
  signup datetime NOT NULL,
  lastlogin datetime NOT NULL,
  notescheck datetime NOT NULL,
  activated enum('0','1') NOT NULL DEFAULT '0' 
  );

CREATE TABLE IF
  NOT EXISTS useroptions(
 id int NOT NULL PRIMARY KEY,
  username varchar(32) NOT NULL UNIQUE KEY,
  FOREIGN KEY (username) REFERENCES users(username),
  background varchar(255) NOT NULL,
  question varchar(255),
  answer varchar(255) 
  );

CREATE TABLE IF NOT EXISTS blockuser(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  blocker varchar(32) NOT NULL,
  FOREIGN KEY (blocker) REFERENCES users(username),
  blokee varchar(32) NOT NULL,
  FOREIGN KEY (blokee) REFERENCES users(username),
  blockdate datetime NOT NULL
  );

CREATE TABLE IF NOT EXISTS friends(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user1 varchar(32) NOT NULL,
  FOREIGN KEY (user1) REFERENCES users(username),
  user2 varchar(32) NOT NULL,
  FOREIGN KEY (user2) REFERENCES users(username),
  friend_date datetime NOT NULL,
  accepted enum('0','1') NOT NULL DEFAULT '0'
  );


CREATE TABLE IF NOT EXISTS updates(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  osid int NOT NULL,
  account_name varchar(32) NOT NULL,
  FOREIGN KEY (account_name) REFERENCES users(username),
  author varchar(32) NOT NULL,
  FOREIGN KEY (author) REFERENCES users(username),
  type_of enum('a','b','c') NOT NULL,
  content text NOT NULL,
  postdate datetime NOT NULL 
  );

CREATE TABLE photos(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_own varchar(32) NOT NULL,
  FOREIGN KEY (user_own) REFERENCES users(username),
  gallery varchar(32) NOT NULL,
  filename varchar(255) NOT NULL,
  description varchar(255),
  uploaddate datetime NOT NULL
  );

CREATE TABLE notification(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username varchar(32) NOT NULL,
  FOREIGN KEY (username) REFERENCES users(username),
  initiator varchar(32) NOT NULL,
  FOREIGN KEY (initiator) REFERENCES users(username),
  app varchar(255) NOT NULL,
  note varchar(255) NOT NULL,
  did_read enum('0','1') NOT NULL DEFAULT '0',
  date_time datetime NOT NULL
  );

