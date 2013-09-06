class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :orders, :dependent => :destroy
  has_many :courses, through: :orders
  has_many :enrolls, :dependent => :destroy
  has_many :courses, through: :enrolls
  
  validates :name,  :presence   => true,
                      :length     => { :maximum => 50 }

    # It returns the articles whose titles contain one or more words that form the query
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
    end
end
