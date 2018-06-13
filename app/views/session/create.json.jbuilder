	json.user do
		json.call(
			@user,
			:id,
			:display_name,
			:email,
			:user_type,
			:fbname
			)
	end