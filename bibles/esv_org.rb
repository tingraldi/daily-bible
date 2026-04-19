module Bible
  extend self

  def build_url(book, chapter)
    "https://www.esv.org/#{book}+#{chapter}/"
  end
end
