json.user do
	json.id @user.id
	json.email @user.email
	json.user_type @user.user_type
	json.display_name @user.display_name
end