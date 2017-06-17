class AccountsController < ApplicationController

  def create
    account = Account.create(email: params[:email], password: params[:password])
    user = User.create(firstName: params[:firstName], lastName: params[:lastName], birthday: params[:birthday], account: account)
    token = JWT.encode({account_id: account.id}, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
    render json: {
      user: {
        id: user.id
      },
      token: token
    }
  end

  def show
    account = Account.find(params[:id])
    user = User.find_by(account: account)
    render json: user.id
  end

  def index
    accounts = Account.all
    render json: accounts

  end


end
