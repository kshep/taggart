# == Schema Information
# Schema version: 20110505212108
#
# Table name: graphs
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  keys       :text
#  created_at :datetime
#  updated_at :datetime
#  start_at   :datetime
#  end_at     :datetime
#

class Graph < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :keys, :start_at, :end_at
  attr_accessible :keys, :start_at, :end_at

  def formatted_start_at
    start_at.strftime('%d/%m/%Y %H:%M')
  end

  def formatted_start_at=(time_str)
    self.start_at = Time.zone.parse(time_str)
  end

  def formatted_end_at
    end_at.strftime('%d/%m/%Y %H:%M')
  end

  def formatted_end_at=(time_str)
    self.end_at = Time.zone.parse(time_str)
  end

end
