class UsersController < ApplicationController
	before_action :set_user

	def show
		@attributes=@user.attributes.except(:_id, :encrypted_password,:reset_password_token)
		puts "==============================="
		puts "@attributes.inspect"
		puts @attributes.inspect
		puts "==============================="
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to :back, notice: 'User was successfully updated.' }
				format.json { render :show, status: :ok, location: @request }
			else
				format.html { render :edit }
				format.json { render json: @request.errors, status: :unprocessable_entity }
			end
		end
	end

	private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:note)
    end
end
