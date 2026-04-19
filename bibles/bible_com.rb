module Bible
  extend self

  def book_map
    {
      'Matthew': 'MAT',
      'Mark': 'MRK',
      'Luke': 'LUK',
      'John': 'JHN',
      'Acts': 'ACT',
      'Romans': 'ROM',
      '1+Corinthians': '1CO',
      '2+Corinthians': '2CO',
      'Galatians': 'GAL',
      'Ephesians': 'EPH',
      'Philippians': 'PHP',
      'Colossians': 'COL',
      '1+Thessalonians': '1TH',
      '2+Thessalonians': '2TH',
      '1+Timothy': '1TI',
      '2+Timothy': '2TI',
      'Titus': 'TIT',
      'Philemon': 'PHM',
      'Hebrews': 'HEB',
      'James': 'JAS',
      '1+Peter': '1PE',
      '2+Peter': '2PE',
      '1+John': '1JN',
      '2+John': '2JN',
      '3+John': '3JN',
      'Jude': 'JUD',
      'Revelation': 'REV',
      'Proverbs': 'PRO'
    }
  end

  def build_url(book, chapter)
    mapped_book = book_map[book]
    "https://www.bible.com/bible/114/#{mapped_book}.#{chapter}.NKJV"
  end
end
