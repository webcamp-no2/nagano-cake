class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :deliveries, dependent: :destroy

  enum admittion_status: { withdraw: false, validity: true}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :kana_last_name
    validates :kana_first_name
    validates :zip_code
    validates :address
    validates :tel
    validates :email, format: {with: VALID_EMAIL_REGEX}
  end
end
