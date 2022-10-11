package main

import (
	"context"
	"database/sql"
	"log"

	"pkg/persistance"
)

func main() {
	ctx := context.Background()

	db, err := sql.Open("postgres", "postgres://postgres:postgrespw@localhost:55000")
	if err != nil {
		panic(1)
	}

	queries := persistance.New(db)

	// list all authors
	authors, err := queries.GetUser(ctx)
	if err != nil {
		panic(1)
	}
	log.Println(authors)

}
