package user

import (
	"log"

	"github.com/jinzhu/gorm"
	uuid "github.com/satori/go.uuid"
)

func (model *User) BeforeCreate(scope *gorm.Scope) error {
	uuid, err := uuid.NewV4()
	if err != nil {
		log.Fatalf("Error %v", err)
	}
	return scope.SetColumn("Id", uuid.String())
}
