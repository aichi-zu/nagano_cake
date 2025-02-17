class AddressesController < ApplicationController
  before_action :authenticate_customer!, only:[:create, :index, :edit, :update, :destroy]

  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
