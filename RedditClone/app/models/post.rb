class Post < ActiveRecord::Base
  validates :user, :title, :subs, presence: true

  belongs_to :sub,
  foreign_key: :sub_id,
  class_name: "Sub"

  belongs_to :user,
  foreign_key: :user_id,
  class_name: "User"

  has_many :postsubs,
  foreign_key: :post_id,
  class_name: "Postsub",
  inverse_of: :post


  has_many :subs,
  through: :postsubs,
  source: :sub

end
