#!/usr/bin/env ruby

require 'date'
require 'optparse'
require 'json'
require_relative './books'

available_sites = Dir.glob('bibles/*.rb').map { File.basename(it, '.*') }
translations = {
  'KJV' => 'King James Version',
  'NKJV' => 'New King James Version',
  'NASB' => 'New American Standard Bible',
  'ESV' => 'English Standard Version',
  'LSB' => 'Legacy Standard Bible'
}

def plan_file_contents
  plan_file = File.expand_path('~/daily-bible.json')
  return {} unless File.exist?(plan_file)

  JSON.parse(File.read(plan_file))
end

def plan_defaults
  plan_from_file = plan_file_contents
  start_of_year = Date.new(Date.today.year).to_s
  {
    d: plan_from_file['start'] || start_of_year,
    s: plan_from_file['site'] || 'esv_org',
    b: plan_from_file['books'] || 'NT.all',
    p: plan_from_file['pod'] || false
  }
end

options = plan_defaults
parser = OptionParser.new
parser.on('-b BOOKS', 'Specify books (NT.all, OT.law, etc.)')
parser.on('-d DATE', 'Specify start date as YYYY-MM-DD')
parser.on('-P', 'Also open Proverb of the day') do |_|
  options[:p] = true
end
parser.on('-p', 'Do not open Proverb of the day') do |_|
  options[:p] = false
end
parser.on('-s SITE', "Specify site to use (#{available_sites.join(', ')})") do |s|
  unless available_sites.include?(s)
    puts "Invalid site. Available sites: #{available_sites.join(', ')}"
    exit 1
  end
  options[:s] = s
end
parser.on('-t translation', "Specify translation (#{translations.keys.join(', ')})") do |t|
  unless translations.keys.include?(t.upcase)
    puts 'Unsupported translation.'
    puts 'Available translations:'
    translations.each do |k, v| puts "#{k}: #{v}" end
    exit 1
  end
  options[:t] = t.upcase
end
parser.parse!(into: options)

require_relative "./bibles/#{options[:s]}" # This is where the Bible module is defined

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

def open_url(book, chapter, translation)
  url = Bible.build_url(book, chapter, translation)
  command = "open -b com.apple.safari #{url}"
  system command
end

def open_proverb_of_the_day(translation)
  day_of_month = Time.now.day
  open_url(:Proverbs, day_of_month, translation)
end

def open_plan_chapter_of_the_day(options)
  books = eval("Books::#{options[:b]}")
  chapter_total = books.reduce(0) { |total, (_, chapter_count)| total + chapter_count }

  start_date = Date.parse(options[:d])
  days_since_start = (Date.today - start_date).to_i + 1 # includes start day
  plan_day = days_since_start % chapter_total
  book, chapter = find_book_and_chapter(books, plan_day)
  open_url(book, chapter, options[:t])
end

def hide_other_apps
  command = "osascript -e 'tell application \"System Events\"' -e 'set visible of every process whose frontmost is false to false' -e 'end tell'"
  system command
end

open_plan_chapter_of_the_day(options)

open_proverb_of_the_day(options[:t]) if options[:p]

hide_other_apps
