#!/usr/bin/env ruby

require 'optparse'
require 'date'
require_relative './books'

options = { d: '2026-1-4', s: 'esv_org', b: 'NT.all' } # arbitrary start of plan
parser = OptionParser.new
parser.on('-b BOOKS', 'Specify books (NT.all, OT.law, etc.)')
parser.on('-d DATE', 'Specify start date as YYYY-MM-DD')
parser.on('-s SITE', 'Specify site to use (esv_org or bible_com)') do |s|
  unless ['esv_org', 'bible_com'].include?(s)
    puts "Invalid site. Available sites: esv_org, bible_com"
    exit 1
  end
  options[:s] = s
end
parser.parse!(into: options)

require_relative "./bibles/#{options[:s]}" # This is where the Bible module is defined

start_date = Date.parse(options[:d])

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

books = eval("Books::#{options[:b]}")
chapter_total = books.reduce(0) { |total, (_, chapter_count)| total + chapter_count }

# Open plan chapter of the day
days_since_start = (Date.today - start_date).to_i + 1 # includes start day
plan_day = days_since_start % chapter_total
book, chapter = find_book_and_chapter(books, plan_day)
open_url(book, chapter)

# Open Proverb of the day
day_of_month = Time.now.day
open_url(:Proverbs, day_of_month)

# Hide other apps
hide_other_apps
