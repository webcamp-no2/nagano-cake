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

  # カートアイテム合計
    # 合計
  def cart_item_sum
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal_price
    end
    total
  end

  def status_validity?
    admittion_status == "validity"
  end

  # ログイン時に退会済会員はログインできないようにする
  def active_for_authentication?
    super && status_validity?
  end
end
