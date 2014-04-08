require 'spec_helper'

describe Guard::Alfred do

  let!(:options) { {} }
  let!(:plugin)  { Guard::Alfred.new(options) }

  describe '#start' do

    it "calls #run_all by default" do
      Guard::Alfred.any_instance.should_receive(:run_all)
      subject.start
    end

    context 'with all_on_start at false' do
      let(:options) { { :all_on_start => false } }

      it "doesn't calls #run_all" do
        Guard::Alfred.any_instance.should_not_receive(:run_all)
        plugin.start
      end
    end
  end

  describe '#run_all' do
    it "runs all scenario's via runner" do
      Guard::Alfred::Runner.any_instance.should_receive(:run_all)
      plugin.run_all
    end
  end

  describe '#run_on_modifications' do
    it "runs the scenario's via runner" do
      Guard::Alfred::Runner.any_instance.should_receive(:run).with(['file1', 'file2'])
      plugin.run_on_modifications(['file1', 'file2'])
    end
  end

end
