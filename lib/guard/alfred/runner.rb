module Guard
  class Alfred
    class Runner

      ##
      # Runs all the scenario's.
      #
      def run_all
        Bundler.with_clean_env { Kernel.system('bundle exec alfred') }
      end

      ##
      # Runs scenario's for controller paths.
      #
      def run(paths)
        return true if paths.empty?
        Bundler.with_clean_env { Kernel.system("bundle exec alfred #{paths.join(' ')}") }
      end

    end # Runner
  end # Alfred
end # Guard
