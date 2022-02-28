class Api::V1::AuthenticationController < ApplicationController
	skip_before_action :authenticate_request

	def authenticate
		command = AuthenticateUser.call(params[:email], params[:password])

		if command.success?
			render json: { auth_token: command.result }
		else
			render json: { error: command.errors }, status: :unauthorized
		end
	end

	def register
		@user = User.new user_params

		userFindByEmail = User.find_by_email(@user.email)

		if userFindByEmail
			render json: { status: false, data: [email: 'email is already created!'] }, status: 400
		else
			if @user.save
				render json: { status: true, data: @user }, status: :created
			else
				render json: { status: false, data: @user.errors }, status: :unprocessable_entity
			end
		end
	end

	private

	def user_params
		params.permit :email, :password, :name
	end
end
