module Site
  extend self

  def build_url(book, chapter, _translation)
    book_plus = book.to_s.gsub(' ', '+')
    "https://read.lsbible.org/?q=#{book_plus}+#{chapter}/"
  end
end
