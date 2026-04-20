#!/usr/bin/env ruby

plan = ARGV[0] || 'nt'

require 'date'
require_relative './bibles/esv_org'
require_relative './books'
require_relative "./plans/#{plan}"

start_date = Date.new(2026, 1, 4) # arbitrary start of plan

def find_book_and_chapter(books, plan_day)
  chapter_count = 0
  books.each do |(book, chapters)|
    new_chapter_count = chapter_count + chapters
    if new_chapter_count < plan_day
      chapter_count = new_chapter_count
      next
    end

    chapter = plan_day - chapter_count
    return book, chapter
  end
end

def open_url(book, chapter)
  url = Bible.build_url(book, chapter)
  command = "open -b com.apple.safari #{url}"
  system command
end

def hide_other_apps
  command = "osascript -e 'tell application \"System Events\"' -e 'set visible of every process whose frontmost is false to false' -e 'end tell'"
  system command
end

books = Plan.books
book_chapters = Books.all.filter { |book, _| books.include?(book) }
chapter_total = book_chapters.reduce(0) { |total, (_, chapter_count)| total + chapter_count }

# Open plan chapter of the day
days_since_start = (Date.today - start_date).to_i + 1 # includes start day
plan_day = days_since_start % chapter_total
book, chapter = find_book_and_chapter(book_chapters, plan_day)
open_url(book, chapter)

# Open Proverb of the day
day_of_month = Time.now.day
open_url(:Proverbs, day_of_month)

# Hide other apps
hide_other_apps
