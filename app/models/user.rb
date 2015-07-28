class User < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :shift
  has_many :reservations, dependent: :destroy
  has_many :frequencies, dependent: :destroy
end
