class SessionController < ApplicationController
	def create
		#echo "create new user"
		@user = User.find_by_email(params[:email])

		if @user
			if @user.valid_password?(params[:password])
				render :create, status: :created
			else
				head(:unauthorized)
			end
		else
			head(:unauthorized)
		end
	end

	def destroy

	end
end