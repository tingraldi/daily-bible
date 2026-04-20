module Books
  module_function

  module OT
    module_function

    def law
      {
        Genesis: 50,
        Exodus: 40,
        Leviticus: 27,
        Numbers: 36,
        Deuteronomy: 34
      }
    end

    def history
      {
        Joshua: 24,
        Judges: 21,
        Ruth: 4,
        '1 Samuel': 31,
        '2 Samuel': 24,
        '1 Kings': 22,
        '2 Kings': 25,
        '1 Chronicles': 29,
        '2 Chronicles': 36,
        Ezra: 10,
        Nehemiah: 13,
        Esther: 10
      }
    end

    def poetry
      {
        Job: 42,
        Psalms: 150,
        Proverbs: 31,
        Ecclesiastes: 12,
        'Song of Solomon': 8
      }
    end

    def major_prophets
      {
        Isaiah: 66,
        Jeremiah: 52,
        Lamentations: 5,
        Ezekiel: 48,
        Daniel: 12
      }
    end

    def minor_prophets
      {
        Hosea: 14,
        Joel: 3,
        Amos: 9,
        Obadiah: 1,
        Jonah: 4,
        Micah: 7,
        Nahum: 3,
        Habakkuk: 3,
        Zephaniah: 3,
        Haggai: 2,
        Zechariah: 14,
        Malachi: 4
      }
    end

    def prophets
      {
        **major_prophets,
        **minor_prophets
      }
    end

    def all
      {
        **law,
        **history,
        **poetry,
        **prophets
      }
    end
  end

  module NT
    module_function

    def gospels
      {
        Matthew: 28,
        Mark: 16,
        Luke: 24,
        John: 21
      }
    end

    def history
      {
        Acts: 28
      }
    end

    def pauline_epistles
      {
        Romans: 16,
        '1 Corinthians': 16,
        '2 Corinthians': 13,
        Galatians: 6,
        Ephesians: 6,
        Philippians: 4,
        Colossians: 4,
        '1 Thessalonians': 5,
        '2 Thessalonians': 3,
        '1 Timothy': 6,
        '2 Timothy': 4,
        Titus: 3,
        Philemon: 1
      }
    end

    def general_epistles
      {
        Hebrews: 13,
        James: 5,
        '1 Peter': 5,
        '2 Peter': 3,
        '1 John': 5,
        '2 John': 1,
        '3 John': 1,
        Jude: 1
      }
    end

    def prophecy
      {
        Revelation: 22
      }
    end

    def all
      {
        **gospels,
        **history,
        **pauline_epistles,
        **general_epistles,
        **prophecy
      }
    end
  end

  def all
    {
      **OT.all,
      **NT.all
    }
  end
end
