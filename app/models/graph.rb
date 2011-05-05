# == Schema Information
# Schema version: 20110505161202
#
# Table name: graphs
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  caption    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Graph < ActiveRecord::Base
  belongs_to :user
end
