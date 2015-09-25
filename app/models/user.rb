class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :interest, dependent: :destroy
  validates_presence_of :first_name

  def self.order_name
    order(:first_name)
  end

end
