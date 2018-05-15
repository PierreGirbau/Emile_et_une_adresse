class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :details, dependent: :destroy
  has_many :places, through: :details
  has_many :saved_places
  has_many :shared_places
  before_save :default_heart_capacity, :default_heart_stock

  def default_heart_capacity
     self.heart_capacity = 5
  end

  def default_heart_stock
     self.heart_stock = 5
  end
end
