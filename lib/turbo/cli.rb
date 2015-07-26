require 'thor'

module Turbo
  class CLI < Thor
    desc "hello NAME", "say hello to NAME"
    def hello(name)
		puts "Hello #{name}"
		"Hello #{name}"
    end
  end
end
