class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :properties

  before_create :set_default_role

  def admin?
    role == 'admin'
  end

  def property_manager?
    role == 'property_manager'
  end

  def tenant?
    role == 'tenant'
  end

  private

  def set_default_role
    self.role ||= 'property_manager'
  end
end
