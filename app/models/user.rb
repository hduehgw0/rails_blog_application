class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # T-18 のアソシエーション (先行実装)
  has_many :posts, dependent: :destroy

  # (Relationshipのアソシエーションは T-18 で実装)

  # バリデーション (仕様書 4.2)
  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, length: { maximum: 200 }
end
