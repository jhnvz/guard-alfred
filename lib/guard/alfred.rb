require 'guard'
require 'guard/plugin'

module Guard
  class Alfred < Plugin
    require 'guard/alfred/runner'

    attr_accessor :options, :runner

    ##
    # Initialize a new plugin.
    #
    # === Params
    #
    # [options [Hash]] optional options hash.
    #
    # === Example
    #
    #   guard :alfred, :all_on_start => false do
    #     watch(%r{^app/controllers/(.+)\.rb$}) { |m| "#{::Alfred.configuration.test_path}/alfreds/#{m[1]}.rb" }
    #     watch(%r{^spec/alfreds/(.+)\.rb$})    { |m| "#{::Alfred.configuration.test_path}/alfreds/#{m[1]}.rb" }
    #   end
    #
    def initialize(options = {})
      super

      @options = {
        :all_on_start         => true,
        :run_all              => {},
        :run_on_modifications => {}
      }.merge(options)

      @runner = Runner.new(@options)
    end

    ##
    # Runs all the scenario's if option all_on_start is true.
    #
    def start
      ::Guard::UI.info 'Guard::Alfred is running'
      run_all if @options[:all_on_start]
    end

    ##
    # Runs all the scenario's.
    #
    def run_all
      runner.run_all
    end

    ##
    # Runs scenario's for the modified controller.
    #
    # === Params
    #
    # [paths (Array)] the controllers to lookup
    #
    def run_on_modifications(paths)
      return false if paths.empty?
      runner.run(paths)
    end

  end # Alfred
end # Guard
