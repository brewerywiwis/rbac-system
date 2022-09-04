BEGIN;
CREATE SCHEMA IF NOT EXISTS core;
CREATE TABLE IF NOT EXISTS core."user" (
    "id" uuid PRIMARY KEY,
    "password" varchar,
    "fname" varchar,
    "lname" varchar
);
CREATE TABLE IF NOT EXISTS core."role" (
    "id" uuid PRIMARY KEY,
    "name" varchar,
    "description" varchar
);
CREATE TABLE IF NOT EXISTS core."user_role" (
    "user_id" uuid,
    "role_id" uuid,
    PRIMARY KEY ("user_id", "role_id"),
    CONSTRAINT user_role_user_id_fk FOREIGN KEY ("user_id") REFERENCES core."user" (id) ON DELETE CASCADE,
    CONSTRAINT user_role_role_id_fk FOREIGN KEY ("role_id") REFERENCES core."role" (id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS core."resource" (
    "id" uuid PRIMARY KEY,
    "name" varchar,
    "description" varchar
);
CREATE TABLE IF NOT EXISTS core."group" (
    "id" uuid PRIMARY KEY,
    "name" varchar,
    "description" varchar
);
CREATE TABLE IF NOT EXISTS core."permission" (
    "resource_id" uuid,
    "role_id" uuid,
    "group_id" uuid,
    PRIMARY KEY ("resource_id", "role_id", "group_id"),
    CONSTRAINT permission_resource_id_fk FOREIGN KEY ("resource_id") REFERENCES core."resource" (id) ON DELETE CASCADE,
    CONSTRAINT permission_role_id_fk FOREIGN KEY ("role_id") REFERENCES core."role" (id) ON DELETE CASCADE,
    CONSTRAINT permission_group_id_fk FOREIGN KEY ("group_id") REFERENCES core."group" (id) ON DELETE CASCADE
);
COMMIT;