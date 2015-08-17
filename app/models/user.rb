class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :authentication_keys => [:phone]  

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "girl.svg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def admin?
    type == 'Admin'
  end

  def show_gender
    gender ? "男" : "女"
  end

  def show_source
    source.zero? ? "Web" : "App"
  end

end
