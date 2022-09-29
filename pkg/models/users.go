package models

type users struct {
	Id        int    `json:"id" gorm:"primaryKey"`
	fulltname string `json:"title"`
	password  string `json:"author"`
}
