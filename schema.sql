drop table if exists pages;
drop table if exists logs;
drop table if exists tags;
drop table if exists pages_tags_assoc;
drop table if exists logs_tags_assoc;

create table pages (
    id integer primary key autoincrement,
    name text not null,
    slug text not null,
    body text
);

create table tags (
    id integer primary key autoincrement,
    name text not null
);

create table pages_tags_assoc (
    pageid integer,
    tagid integer,
    FOREIGN KEY(pageid) REFERENCES pages(id),
    FOREIGN KEY(tagid) REFERENCES tags(id)
);

create table logs (
    id integer primary key autoincrement,
    body text not null,
    ts integer not null
);

create table logs_tags_assoc (
    logid integer,
    tagid integer,
    FOREIGN KEY(logid) REFERENCES logs(id),
    FOREIGN KEY(tagid) REFERENCES tags(id)
);

create table logs_pages_assoc (
    logid integer,
    pageid integer,
    FOREIGN KEY(logid) REFERENCES logs(id),
    FOREIGN KEY(pageid) REFERENCES pages(id)
);
