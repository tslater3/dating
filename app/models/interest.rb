class Interest < ActiveRecord::Base
  belongs_to :user

  def self.by_profession
    order(:profession)
  end

  
end
