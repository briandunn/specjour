require 'spec_helper'
describe Specjour::Cucumber::Runner do
  describe :run do
    before do
      @output = stub(Object.new)
      stub(::Cucumber::Cli::Main).step_mother {nil}
      @default_options = ['--format', 'Specjour::Cucumber::DistributedFormatter', 'a.feature']
    end
    it "should pass formatter and feature and output to the Cucumber Cli" do
      mock(::Cucumber::Cli::Main).new(@default_options, @output).stub!.execute! {nil}
    end
    describe "with CUCUMBER_OPTS" do
      before { ENV['CUCUMBER_OPTS'] = "--tags ~@wip" }
      it "should also pass those along" do
        mock(::Cucumber::Cli::Main).new(['--tags','~@wip'] + @default_options, @output).stub!.execute! {nil}
      end
      describe "that specify a format" do
        before { ENV['CUCUMBER_OPTS'] = "--format pretty" }
        it "should override the environment format with the specjour formatter" 
      end
    end
    after do
      Specjour::Cucumber::Runner.run('a.feature',@output)
    end
  end
end
