# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  meia_url   :string(255)
#  chapter    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  media      :string(255)
#  awsurl     :string(255)
#  module     :string(255)
#

class Video < ActiveRecord::Base
        attr_accessible :title, :body, :media, :chapter, :awsurl, :module
        belongs_to :course
    end
