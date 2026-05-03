There is not much code here and there likely never will be.

I created this project to host the `open-bible.rb` script and supporting files. I run the script daily
on my laptop to make it easy to stick with a daily bible reading plan. The script assumes you are running on a
Mac.

The script will open one chapter from a specified section of the bible. It can optionally open the "Proverb of the day" as well.
If you are reading through the New Testament, for example, and you reach the end of Revelation, on the next day you will
be back in Matthew chapter 1.

Reading plan defaults can be set in the `daily-bible.json` file in your home directory. This makes invocation of the
script easier, since you won't have to specify all the arguments each time.

Here's a sample `daily-bible.json` file:

```json
{
  "start": "2026-01-04",
  "site": "bible_com",
  "translation": "ESV",
  "books": "NT.all",
  "pod": true
}
```

The `pod` key stands for "Proverb of the day". Setting it to `true` will cause the script to open the Proverb of the day in addition to the chapter of the Bible. Setting it to `false` will prevent the script from opening the Proverb of the day.

The script help is currently as follows:

```
Usage: open-bible.rb [options]
    -b BOOKS                         Specify books (NT.all, OT.law, etc.)
    -d DATE                          Specify start date as YYYY-MM-DD
    -P                               Also open Proverb of the day
    -p                               Do not open Proverb of the day
    -s SITE                          Specify site to use (bible_com, esv_org, literalword_com, lsbible_org, stepbible_org)
    -t translation                   Specify translation (KJV, NKJV, NASB, ESV, LSB)
```

The sites supported thus far are those that I consider to be the most reader-friendly. None of them contain ads. Not all
sites support all the translations that the script supports. In cases where a mismatch occurs, the script will 
fall back to a translation that is supported by the selected site. The script will also default to the ESV translation if no translation is specified.

I've found this to be useful. Perhaps you will too.
