package db

import (
	"log"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// structure of data to be used
type User struct {
	Id        int    `json:"id" gorm:"primaryKey"`
	Full_name string `json:"full_name"`
	Password  string `json:"password"`
}

/*
	type Projects struct {
		Id        int    `json:"id" gorm:"primaryKey"`
		Project_name string `json:"full_name"`
		Password  string `json:"password"`
	}

	type Executer struct {
		Id        int    `json:"id" gorm:"primaryKey"`
		Full_name string `json:"full_name"`
		Password  string `json:"password"`
	}

	type Cost_calc struct {
		Id        int    `json:"id" gorm:"primaryKey"`
		Full_name string `json:"full_name"`
		Password  string `json:"password"`
	}
*/
func Init() *gorm.DB {
	dbURL := "postgres://postgres:postgrespw@localhost:55000/project_tracker"

	db, err := gorm.Open(postgres.Open(dbURL), &gorm.Config{})

	if err != nil {
		log.Fatalln(err)
	}
	return db
}


func 