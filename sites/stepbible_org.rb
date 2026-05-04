module Site
  extend self

  def translation_name(name)
    names = {
      'KJV' => 'KJV',
      'NKJV' => 'KJV',
      'NASB' => 'NASB1995',
      'ESV' => 'ESV',
      'LSB' => 'LSB'
    }
    names[name] || names['ESV']
  end

  def build_url(book, chapter, translation)
    book_smashed = book.to_s.gsub(' ', '')
    step_translation = translation_name(translation)
    "https://www.stepbible.org/?q=version=#{step_translation}@reference=#{book_smashed}.#{chapter}"
  end
end
