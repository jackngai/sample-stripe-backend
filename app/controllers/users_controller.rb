require 'stripe'

class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def new
    user = User.create(name: params[:name])
    customer = Stripe::Customer.create
    user.customerId = customer.id
    user.save
    render json: user, status: :created
  end
end
