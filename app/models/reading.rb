class Reading < ApplicationRecord

  validates :name, presence: { message: "Please add the name of the book!" }, uniqueness: { scope: [:author, :name], message: "I think you already have this book on your list!" }
  validates :author, presence: { message: "Please add the author's name!" }

  has_many :bookmarks, dependent: :destroy

end
