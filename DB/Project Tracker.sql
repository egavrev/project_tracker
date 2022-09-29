CREATE TYPE "project_type" AS ENUM (
  'overtime',
  'timeandmaterial',
  'fixprice'
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "full_name" varchar,
  "password" varchar
);

CREATE TABLE "projects" (
  "id" SERIAL PRIMARY KEY,
  "project_name" project_type DEFAULT (overtime),
  "type" int,
  "preiod_from" datetime DEFAULT (now()),
  "preiod_to" datetime DEFAULT (now())
);

CREATE TABLE "executer" (
  "id" SERIAL PRIMARY KEY,
  "project_id" int,
  "profile" varchar,
  "stack" varchar
);

CREATE TABLE "cost_calc" (
  "id" SERIAL PRIMARY KEY,
  "project_id" int,
  "executor_id" int,
  "unit_price" int,
  "total_units" int
);

CREATE TABLE "cost_calc_invoice" (
  "id" SERIAL PRIMARY KEY,
  "cost_calc_id" int,
  "correction" int,
  "correction_comment" varchar,
  "total_sum" int,
  "preiod_from" datetime,
  "period_to" datetime
);

CREATE TABLE "notificator" (
  "id" SERIAL PRIMARY KEY,
  "cost_calc_invoice_id" int,
  "message" varchar,
  "confrimed" boolean DEFAULT (falce)
);

ALTER TABLE "executer" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");

ALTER TABLE "cost_calc" ADD FOREIGN KEY ("project_id") REFERENCES "projects" ("id");

ALTER TABLE "cost_calc" ADD FOREIGN KEY ("executor_id") REFERENCES "executer" ("id");

ALTER TABLE "cost_calc_invoice" ADD FOREIGN KEY ("cost_calc_id") REFERENCES "cost_calc" ("id");

ALTER TABLE "notificator" ADD FOREIGN KEY ("cost_calc_invoice_id") REFERENCES "cost_calc_invoice" ("id");
