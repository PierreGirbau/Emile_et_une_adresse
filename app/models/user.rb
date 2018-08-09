class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_many :details, dependent: :destroy
  has_many :places, through: :details
  has_many :saved_places, dependent: :destroy
  has_many :shared_places, dependent: :destroy
  before_save :default_heart_capacity, :default_heart_stock
  validate :uniqu_email

  def uniqu_email
    self.errors.add(:email, 'Email is already in use') if User.where(:email => self.email).exists?
  end

  def default_heart_capacity
     self.heart_capacity = 5
  end

  def default_heart_stock
     self.heart_stock = 5
  end
end
