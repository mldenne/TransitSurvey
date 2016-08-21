class Point < ApplicationRecord

  belongs_to :commute

  has_many :textfiles

end
