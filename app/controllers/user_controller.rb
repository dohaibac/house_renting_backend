class UserController < ApplicationController

	rescue_from ActiveRecord::RecordNotFound do |e|
    render_json_error :not_found, :user_not_found
  end

  def show
  	@user = User.find(params[:id])
  	render :show
  end

	def create
		@user = User.new(user_params)

		if @user.user_type.downcase != "owner"
			@user.user_type = "renter"
		end

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
      params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
    end
end
