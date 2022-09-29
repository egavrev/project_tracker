migrateup:
	migrate -path DB/migrations -database "postgresql://postgres:postgrespw@localhost:55000/project_tracker?sslmode=disable" -verbose up
migratedown:
	migrate -path DB/migrations -database "postgresql://postgres:postgrespw@localhost:55000/project_tracker?sslmode=disable" -verbose down
