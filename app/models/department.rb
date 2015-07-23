class Department < ActiveRecord::Base
  belongs_to :institution
  has_many :floors, dependent: :destroy
end
