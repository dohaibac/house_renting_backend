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

	def fblogin
		@user = User.find_by_email(params[:email])
		if !@user
			@user = User.new(:email => params[:email], :fbname => params[:display_name], :display_name => params[:display_name])
			@user.save
		elsif !(@user.display_name)
			@user.display_name = params[:display_name]
			@user.save
		end

		render :create, status: :created
	end
end