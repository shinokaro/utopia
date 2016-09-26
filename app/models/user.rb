class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :user_promoters, class_name: "Meeting", foreign_key: :promoter_id
  has_many :promoters, through: :user_promoters
  has_many :user_participants, class_name: "Meeting", foreign_key: :participant_id
  has_many :participants, through: :user_participants
end
