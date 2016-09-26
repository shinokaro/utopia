class Meeting < ActiveRecord::Base
  belongs_to :promoter
  belongs_to :participant
end
