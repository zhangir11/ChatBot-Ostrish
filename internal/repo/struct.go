package repo

import "github.com/jmoiron/sqlx"

type ChatRepo struct {
	db *sqlx.DB
}

func (cr *ChatRepo) Add() {

}
