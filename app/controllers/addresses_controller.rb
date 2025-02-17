class AddressesController < ApplicationController
  before_action :authenticate_customer!, only:[:create, :index, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def create
    @address = current_customer.Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
   def address_params
    params.require(:address).permit(:post_code, :address, :name)
   end

end
