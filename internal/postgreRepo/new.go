package postgrerepo

import (
	"fmt"
	"time"

	"ostrich/configs"

	_ "github.com/jackc/pgx/stdlib"
	"github.com/jmoiron/sqlx"
)

func NewPostgresRepository(config *configs.Config) (*sqlx.DB, error) {
	DSN := fmt.Sprintf("postgres://%s:%s@%s%s/%s", config.UserDB, config.PasswordDB, config.HostDB, config.PortDB, config.NameDB)

	db, err := sqlx.Connect("pgx", DSN)
	if err != nil {
		return nil, fmt.Errorf("postgres: %w\n%v", err, DSN)
	}
	db.SetMaxOpenConns(5) // TODO 25
	db.SetConnMaxLifetime(1 * time.Minute)

	return db, err
}
