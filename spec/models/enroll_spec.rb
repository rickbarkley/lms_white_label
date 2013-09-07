# == Schema Information
#
# Table name: enrolls
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  expiration :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Enroll do
  pending "add some examples to (or delete) #{__FILE__}"
end
