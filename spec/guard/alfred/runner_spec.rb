require 'spec_helper'

describe Guard::Alfred::Runner do

  let!(:runner) { Guard::Alfred::Runner.new }

  describe '#run_all' do

    it 'should display a message with Guard::UI' do
      ::Guard::UI.should_receive(:info).with("Running all Alfred scenario's\n", :reset => true)
      runner.run_all
    end

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

      it 'should display a message with Guard::UI' do
        ::Guard::UI.should_receive(:info).with("Alfred is looking for: file1 file2\n", :reset => true)
        runner.run(paths)
      end

      it 'should run alfred executable' do
        Kernel.should_receive(:system).with('bundle exec alfred file1 file2')
        runner.run(paths)
      end

    end

  end

end
