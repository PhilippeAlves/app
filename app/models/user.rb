class User < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :shift
  has_many :reservations, dependent: :destroy
  has_many :frequencies, dependent: :destroy
  has_many :user_frequencies, dependent: :destroy

  validates :card, length: { minimum: 10 }
  validates :name, presence: true
  validates :card, presence: true, uniqueness: true
  validates :user_group_id, presence: true
end
