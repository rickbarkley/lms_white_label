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

require 'spec_helper'

describe Video do
  pending "add some examples to (or delete) #{__FILE__}"
end
