class Api::V1::AuthController < ApplicationController

	def create
		account = Account.find_by(username: params[:username])
		if account.present? && account.authenticate(params[:password])
			account_jwt = {:account => account.id}
			token = JWT.encode account_jwt, 'my$ecretK3y', 'HS256'
			render json: {username: params[:username], jwt: token}
		else
			render json: {error: 'No account or password found'}
		end
	end


end

# decoded_token = JWT.decode token, 'my$ecretK3y', true, { :algorithm => 'HS256' }