class User < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :company, dependent: :destroy
  has_many :albums, dependent: :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :company

  validates :name, :username, :email, :phone, :website, presence: true

  def to_param
    username
  end
end
