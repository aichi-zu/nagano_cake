class OrdersController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :confirm, :create, :index, :show, :thanks]

  def new
  end

  def create
  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
