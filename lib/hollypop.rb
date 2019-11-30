require "pry"
require "nokogiri"
require "open-uri"
require_relative "./hollypop/version"

module HollyPop
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./hollypop/cli"
require_relative "./hollypop/artist"
require_relative "./hollypop/question"
require_relative "./hollypop/game"
require_relative "./hollypop/scraper"