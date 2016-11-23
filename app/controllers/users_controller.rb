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

  def customer
    user = User.find(params[:id])
    customer = Stripe::Customer.retrieve(user.customerId)
    render json: customer
  end

  def customer_sources
    begin
      user = User.find(params[:id])
      customer = Stripe::Customer.retrieve(user.customerId)
      customer.sources.create(source: params[:source])
    rescue Stripe::StripeError => e
      render json: {error: "Error retrieving customer: #{e.message}"}, status: 402
    end
  end

  def customer_default_source
    begin
      user = User.find(params[:id])
      customer = Stripe::Customer.retrieve(user.customerId)
      customer.default_source = params[:default_source]
      customer.save
    rescue Stripe::StripeError => e
      render json: {error: "Error retrieving customer: #{e.message}"}, status: 402
    end
  end
end
