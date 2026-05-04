module Site
  extend self

  def build_url(book, chapter, _translation)
    book_plus = book.to_s.gsub(' ', '+')
    "https://www.esv.org/#{book_plus}+#{chapter}/"
  end
end
