class WelcomeUserMailer < ApplicationMailer
	def send_welcome(user)
		@user = user
		mail to: @user.email, subject: "Welcome to House Renting", from: "dohaibac@gmail.com"
	end
end
