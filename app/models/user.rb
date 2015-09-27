class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :interest, dependent: :destroy
  validates_presence_of :first_name

  def self.by_name
    order(:first_name)
  end

  # def females_only
  #
  # end
  #
  # def males_only
  #
  # end

#   def upvote
#    @post = Post.find(params[:id])
#    @post.vote += 1
#    @post.save!
#    redirect_to root_path
#  end
#
#  def downvote
#    @post = Post.find(params[:id])
#    @post.vote += -1
#    @post.save!
#    redirect_to root_path
#  end
end
