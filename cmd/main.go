package main

import (
	"log"
	"net/http"

	"github.com/egavrev/project_tracker/pkg/db"
	"github.com/egavrev/project_tracker/pkg/handlers"

	"github.com/gorilla/mux"
)

func main() {
	DB := db.Init()
	h := handlers.New(DB)
	router := mux.NewRouter()

	log.Println("API is running!")
	http.ListenAndServe(":4000", router)
}
