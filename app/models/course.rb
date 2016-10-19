class Course < ActiveRecord::Base
  has_many :recipes

  validates :name, uniqueness: true, presence: true
end
