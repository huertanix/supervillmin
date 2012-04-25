#!/usr/bin/env ruby
# Copyright (c) 2012 David Huerta c/o The Guild of Calamitous Intent. Distributed under the MIT license: http://www.opensource.org/licenses/mit-license.php

if ARGV.empty?
  puts 'Usage: $./supervillmin.rb uncompressedfile1.js uncompressedfile2.js ...'
  puts 'Result will be a file called build.js, so don\'t name any of the input files that plz'
  puts 'Also, make sure input files are actually JS, lest there be shenanigans.'
elsif ARGV.length > 9000
  puts 'OVER 9000'
else
  uncompressed_js = String.new
  compressed_js = String.new
  
  ARGV.each do |filename| 
    begin
      file = File.open(filename, 'rb')
      uncompressed_js += file.read
    rescue => err
      puts "Exception: #{err}"
      err
    end
  end
  
  # Replace carriage returs with line feeds
  compressed_js = uncompressed_js.gsub(/\r/, "\n")
  # Replace tabs with spaces
  ##compressed_js = compressed_js.gsub(/\t/, " ")
  # USE THIS INSTEAD OF ABOVE
  compressed_js = compressed_js.gsub(/[\a\e\f\r\t\v]/, " ")
  # Remove comments, ala http://stackoverflow.com/questions/5989315/regex-for-match-replacing-javascript-comments-both-multiline-and-inline#5989450
  # I had to tweak it a bit, because the Internet lies to me
  #compressed_js = compressed_js.gsub(/(\/\*[\w\'\s\r\n\*.]*\*\/)|(\/\/[\w\s\']*\n)/, " ")
  compressed_js = compressed_js.gsub(/\/\/[\w\s\']*\n/, "\n")
  compressed_js = compressed_js.gsub(/\/\*[\w\'\s\r\n\*.]*\*\//, " ")
  # Replace concurrent spaces/linefeeds with single spaces/linefeeds
  # TODO: Check for conditions where special chars are legit (in a string or regex declaration)
  compressed_js = compressed_js.gsub(/  +/, " ")
  compressed_js = compressed_js.gsub(/\n\n+/, "\n")
  # TODO: Conditionally replace spaces with nothingness according to JSMin rules:
  # "It omits spaces except when a space is preceded and followed by a non-ASCII character or 
  #by an ASCII letter or digit, or by one of these characters: \ $ _"
  # hmmm... x20 == 32 dec, x7E == 126 dec, should be 126 through whatev upper limit
  compressed_js = compressed_js.gsub(/[^[\x20-\x7Ea-zA-Z0-9\$\\_]] [^[\x20-\x7Ea-zA-Z0-9\$\\_]]/, "")
  
  puts compressed_js
  
  #begin
  #  File.open('build.js', 'w') { |f| f.write(compressed_js) }
  #rescue => err
  #  puts "Exception: #{err}"
  #  err
  #end
end