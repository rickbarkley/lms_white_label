class Video < ActiveRecord::Base
        attr_accessible :title, :body, :media, :chapter
        belongs_to :course
    end
