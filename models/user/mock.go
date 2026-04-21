package user

type Mock struct{}

func (Mock) List() (accounts []string) {
	return []string{"admin@tiaui.co"}
}

func (Mock) Exist(account string) bool {
	if account == "admin@tiaui.co" {
		return true
	}
	return false
}

func (Mock) Save(account string, user interface{}) error {
	return nil
}

func (Mock) Update(account string, user interface{}) error {
	return nil
}

func (Mock) Find(account string, user *User) {
	user.Profile.Account = "admin@tiaui.co"
	return
}
