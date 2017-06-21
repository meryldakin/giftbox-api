class AuthController < ApplicationController

  def create
    account = Account.find_by(email: params[:email])
    email = params[:email]
    if account.present? && account.authenticate(params[:password])
      user = User.find_by(account: account)
      session[:current_user_id] = user.id
      token = JWT.encode({account_id: account.id}, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])

      render json: {
        user: {
          id: user.id
        },
        token: token
      }
    else
      render json: {error: 'No account or password found'}
    end
  end

  def decode_token
    jwt = JWT.decode(params[:token], ENV['JWT_SECRET'], "H256")
    user = User.find_by(account: Account.find(jwt[0]["account_id"]))
    render json: user
  end

end
