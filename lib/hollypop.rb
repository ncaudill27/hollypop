require "pry"
require_relative "./hollypop/version"

module HollyPop
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./hollypop/cli"
require_relative "./hollypop/artist"
require_relative "./hollypop/question"