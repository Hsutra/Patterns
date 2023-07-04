CREATE TABLE IF NOT EXISTS students (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  surname     text not null,
  first_name  text not null,
  father_name text not null,
  phone       text null,
  telegram    text null,
  email       text null,
  git         text null
);