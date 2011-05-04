class Graph < ActiveRecord::Base
  belongs_to :user
  has_many   :curves
end
