class Department < ActiveRecord::Base
  belongs_to :institution
  has_many :rooms, dependent: :destroy
end
