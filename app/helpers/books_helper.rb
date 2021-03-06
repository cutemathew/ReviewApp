module BooksHelper

  def rated_by_user?(book)
    rate = Rate.where(rater_id: current_user.id, rateable_id: book.id)
    return true unless rate.blank?
  end

  def reviews_count(book)
    count = Rate.where(rateable_id: book.id).count
  end

end
