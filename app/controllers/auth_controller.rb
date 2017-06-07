class AuthController < ApplicationController

  def create
    account = Account.find_by(email: params[:email])
    email = params[:email]
    if account.present? && account.authenticate(params[:password])
      token = JWT.encode({account_id: account.id}, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
      render json: {
        account: {
          email: account.email,
          id: account.id
        },
        token: token
      }
    else
      render json: {error: 'No account or password found'}
    end
  end
end
