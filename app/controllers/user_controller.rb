class UserController < ApplicationController
	def create
		@user = User.new(user_params)

		if @user.save
			render :create
		else
			head(:unprocessable_entity)
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
