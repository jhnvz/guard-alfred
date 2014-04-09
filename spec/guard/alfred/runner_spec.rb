require 'spec_helper'

describe Guard::Alfred::Runner do

  let!(:runner) { Guard::Alfred::Runner.new }

  describe '#run_all' do

    it 'should run alfred executable' do
      Kernel.should_receive(:system).with('bundle exec alfred')
      runner.run_all
    end

  end

  describe '#run' do

    context 'no paths' do

      let!(:paths) { [] }

      it 'return true and do nothing' do
        runner.run(paths).should be_true
      end

      it 'should not run alfred executable' do
        Kernel.should_not_receive(:system)
        runner.run(paths)
      end

    end

    context 'with paths' do

      let!(:paths) { ['file1', 'file2'] }

      it 'should run alfred executable' do
        Kernel.should_receive(:system).with('bundle exec alfred file1 file2')
        runner.run(paths)
      end

    end

  end

end
