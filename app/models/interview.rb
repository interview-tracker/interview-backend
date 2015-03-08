class Interview < ActiveRecord::Base
  belongs_to :user
  has_one :listing

#  def self.interview_date(string_time)
 #   time = DateTime.strptime(string_time)
#  end
end
