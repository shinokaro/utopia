class Meeting < ActiveRecord::Base
  belongs_to :promoter, class_name: "User", foreign_key: promoter_id
  belongs_to :participant, class_name: "User", foreign_key: participant_id
end
