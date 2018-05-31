json.data do
	json.user do
		json.id @user.id
		json.email @user.email
		json.email @user.user_type
	end
end