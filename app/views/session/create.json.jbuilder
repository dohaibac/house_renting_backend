json.data do
	json.user do
		json.call(
			@user,
			:email,
			:user_type
			)
	end
end