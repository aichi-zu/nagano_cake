class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses

  validates :post_code, format: {with: /\A\d{7}\z/}
  validates :phone_number, format: {with: /\A\d{10,11}\z/}

  def active?
    self.is_active
  end

end
