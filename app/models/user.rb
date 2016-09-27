class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile

  has_many :promotions, class_name: "Meeting", foreign_key: :promoter_id
  has_many :promoters, through: :promotions

  has_many :participations, class_name: "Meeting", foreign_key: :participant_id
  has_many :participants, through: :participations

  def have_mtg?
    self.promotions.where(participant_id: nil).present?
  end
end
