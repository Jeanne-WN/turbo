require 'thor'
require 'term/ansicolor'

module Turbo
  class CLI < Thor
  	include Term::ANSIColor

    desc "hello NAME", "say hello to NAME"
    def hello(name)
      puts "Hello #{name}"
      "Hello #{name}"
    end

    desc "generate WORKFLOW", "Generate a workflow"
    def generate(name)
      if File.exist? "workflows/#{name}"
        puts "workflow #{green(name)} has already exist under workflows/#{name}"
        return
      end

      FileUtils.mkdir_p "workflows"
      FileUtils.mkdir_p "workflows/#{name}"

      FileUtils.mkdir_p "workflows/#{name}/bin"
      FileUtils.mkdir_p "workflows/#{name}/data"
      FileUtils.mkdir_p "workflows/#{name}/scenarios"

      FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), "templates/before.sh"), "workflows/#{name}/bin/before.sh"
      FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), "templates/after.sh"), "workflows/#{name}/bin/after.sh"

      FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), "templates/resource.json"), "workflows/#{name}/data/resource.json"
      FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), "templates/resource-get.json"), "workflows/#{name}/scenarios/resource-get.json"

      FileUtils.copy File.join(File.dirname(File.expand_path(__FILE__)), "templates/workflow.json"), "workflows/#{name}/workflow.json"

      puts "Workflow `#{green(name)}` is generated under workflows/#{name}"
      puts "Run `turbo start #{green(name)}` to start the workflow"
  	end

    desc "execute WORKFLOW", "run test cases in WORKFLOW"
    def exec(workflow)
      puts "running."
    end
  end
end
