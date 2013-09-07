# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  cost        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  media_url   :string(255)
#

require 'spec_helper'

describe Course do
  pending "add some examples to (or delete) #{__FILE__}"
end
