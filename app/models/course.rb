class Course < ActiveRecord::Base
    has_many :videos, :dependent => :destroy
    has_many :orders
    has_many :users, through: :orders
    has_many :enrolls
    has_many :users, through: :enrolls
    attr_accessible :videos_attributes, :cost, :description, :title, :media_url, :chapter, :media
    accepts_nested_attributes_for :videos, :allow_destroy => true
    
    def accessible_by_user?(user)
        # Look for course orders that belong to given user and have not expired
        orders = self.orders.where("user_id = ?", user.id)
        !orders.blank? # Returns true if there is at least one order found, otherwise returns false
    end
    
    def accessible_to_user?(user)
        # Look for course orders that belong to given user and have not expired
        enrolls = self.enrolls.where("user_id = ?", user.id)
        !enrolls.blank? # Returns true if there is at least one order found, otherwise returns false
        end
    
    validates :title,   	:presence   => true,
    :length     => { :maximum => 50 }
    validates :description, :presence   => true
    
    validates :cost,	:presence  => true
    
end
