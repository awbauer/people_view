#!/usr/bin/env ruby
require 'nokogiri'
require 'github/markup'


def preformatted_html
  file = ARGV.first
  GitHub::Markup.render(file, File.read(file))
end

def doc
  @doc ||= Nokogiri::HTML::fragment(preformatted_html)
end

doc.css("pre").wrap("<div class='help-callout'></div>")
doc.css("h1").remove
puts doc.to_html
