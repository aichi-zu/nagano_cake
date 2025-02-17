class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }

  def self.payment_method_i18n
    payment_methods.keys.index_with do |key|
      I18n.t("enums.order.payment_method.#{key}")
    end.symbolize_keys
  end

end
