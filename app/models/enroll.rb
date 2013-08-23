class Enroll < ActiveRecord::Base
    attr_accessible :expiration, :user_id, :course_id
    belongs_to :user
    belongs_to :course
end
