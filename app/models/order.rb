class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  def self.payment_method_i18n
    {
      credit_card: I18n.t('payment.credit_card'),
      transfer: I18n.t('payment.transfer')
    }
  end

end
