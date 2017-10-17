class Bookmark < ApplicationRecord

  validates :page_number, presence: { message: "Please add the page number!" }, uniqueness: { scope: [:page_number, :description], message: "I think you already have this bookmark on your list!" }
  validates :description, presence: { message: "Please add a description!" }

  belongs_to :reading

end
