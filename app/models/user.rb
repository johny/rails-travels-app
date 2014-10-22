class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  # relations

  has_many :journeys
  has_many :posts

  # attributes

  has_attached_file :avatar,
    :styles => {
      :medium => "300x300",
      :small => "100x100" },
    :default_url => "avatar/:style.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
