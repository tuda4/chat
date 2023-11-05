CREATE TYPE status_account as ENUM ('INVITED', 'CONFIRMED')

CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "uuid" string UNIQUE,
  "email" varchar(255) NOT NULL,
  "password" varchar(255) NOT NULL,
  "status"  status_account NOT NULL DEFAULT 'INVITED',
  "created_at" timestamptz NOT NULL DEFAULT 'now()',
  "updated_at" timestamptz NOT NULL DEFAULT 'now()',
  "deleted_at" timestamptz
);

CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "uuid" string,
  "name" varchar(100),
  "birthday" timestamp,
  "address" varchar(255),
  "phone" varchar(20),
  "created_at" timestamptz NOT NULL DEFAULT 'now()',
  "updated_at" timestamptz NOT NULL DEFAULT 'now()',
  "deleted_at" timestamptz
);

CREATE TABLE "user_histories" (
  "id" bigserial PRIMARY KEY,
  "uuid" string,
  "action" int NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT 'now()',
  "deleted_at" timestamptz
);

ALTER TABLE "users" ADD FOREIGN KEY ("uuid") REFERENCES "accounts" ("uuid");

ALTER TABLE "user_histories" ADD FOREIGN KEY ("uuid") REFERENCES "accounts" ("uuid");
