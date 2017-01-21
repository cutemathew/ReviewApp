class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews

  ratyrate_rateable "book_rating"

  has_attached_file :avatar, styles: { book_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  #validates :title, presence:true
end
