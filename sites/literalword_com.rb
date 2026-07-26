module Site
  extend self

  def translation_name(name)
    names = {
      'KJV' => 'kjv',
      'NKJV' => 'nkjv',
      'NASB' => 'nasb',
      'ESV' => 'esv',
      'LSB' => 'lsb'
    }
    names[name] || names['ESV']
  end

  def build_url(book, chapter, translation)
    book_plus = book.to_s.gsub(' ', '+')
    translation_prefix = translation_name(translation)
    "https://#{translation_prefix}.literalword.com/?q=#{book_plus}+#{chapter}/"
  end
end
