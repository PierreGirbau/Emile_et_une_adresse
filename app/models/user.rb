class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :details, dependent: :destroy
  has_many :places, through: :details
  has_many :saved_places, dependent: :destroy
  has_many :shared_places, dependent: :destroy
end
