class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :name, :address, :phone

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ads

  def admin?
    self.role == 1
  end

end
