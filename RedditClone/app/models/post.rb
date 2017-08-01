class Post < ActiveRecord::Base
  validates :user, :title, :sub, presence: true

  belongs_to :sub
  foreign_key: :sub_id,
  class_name: "Sub"

  belongs_to :user,
  foreign_key: :id,
  class_name: "User"
end
