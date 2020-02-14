class Delivery < ApplicationRecord
	belongs_to :customer

  def full_address
    zip_code + address
  end

end
