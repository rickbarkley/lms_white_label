class Enroll < ActiveRecord::Base
    attr_accessible :expiration, :user_id, :course_id
    belongs_to :user
    belongs_to :course
    
    # It returns the articles whose titles contain one or more words that form the query
    def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("user_id like ?", "%#{query}%")
    end
end
