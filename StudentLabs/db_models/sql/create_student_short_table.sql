CREATE TABLE IF NOT EXISTS students (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname    text not null,
    git         text null,
    contact     text null
);