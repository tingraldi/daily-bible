module Bible
  extend self

  def book_map
    {
      # Old Testament - Law (Pentateuch)
      Genesis: 'GEN',
      Exodus: 'EXO',
      Leviticus: 'LEV',
      Numbers: 'NUM',
      Deuteronomy: 'DEU',

      # Old Testament - History
      Joshua: 'JOS',
      Judges: 'JDG',
      Ruth: 'RUT',
      '1 Samuel': '1SA',
      '2 Samuel': '2SA',
      '1 Kings': '1KI',
      '2 Kings': '2KI',
      '1 Chronicles': '1CH',
      '2 Chronicles': '2CH',
      Ezra: 'EZR',
      Nehemiah: 'NEH',
      Esther: 'EST',

      # Old Testament - Poetry / Wisdom
      Job: 'JOB',
      Psalms: 'PSA',
      Proverbs: 'PRO',
      Ecclesiastes: 'ECC',
      'Song of Solomon': 'SNG',

      # Old Testament - Prophets
      Isaiah: 'ISA',
      Jeremiah: 'JER',
      Lamentations: 'LAM',
      Ezekiel: 'EZK',
      Daniel: 'DAN',
      Hosea: 'HOS',
      Joel: 'JOL',
      Amos: 'AMO',
      Obadiah: 'OBA',
      Jonah: 'JON',
      Micah: 'MIC',
      Nahum: 'NAM',
      Habakkuk: 'HAB',
      Zephaniah: 'ZEP',
      Haggai: 'HAG',
      Zechariah: 'ZEC',
      Malachi: 'MAL',

      # New Testament - Gospels
      Matthew: 'MAT',
      Mark: 'MRK',
      Luke: 'LUK',
      John: 'JHN',

      # New Testament - History
      Acts: 'ACT',

      # New Testament - Pauline Epistles
      Romans: 'ROM',
      '1 Corinthians': '1CO',
      '2 Corinthians': '2CO',
      Galatians: 'GAL',
      Ephesians: 'EPH',
      Philippians: 'PHP',
      Colossians: 'COL',
      '1 Thessalonians': '1TH',
      '2 Thessalonians': '2TH',
      '1 Timothy': '1TI',
      '2 Timothy': '2TI',
      Titus: 'TIT',
      Philemon: 'PHM',

      # New Testament - General Epistles
      Hebrews: 'HEB',
      James: 'JAS',
      '1 Peter': '1PE',
      '2 Peter': '2PE',
      '1 John': '1JN',
      '2 John': '2JN',
      '3 John': '3JN',
      Jude: 'JUD',

      # New Testament - Prophecy
      Revelation: 'REV'
    }
  end

  def build_url(book, chapter)
    mapped_book = book_map[book]
    "https://www.bible.com/bible/114/#{mapped_book}.#{chapter}.NKJV"
  end
end
