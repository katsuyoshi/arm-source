require 'spec_helper'

module Sudoku

  describe Analyzer do

    before do
      @initial_condition = [
                      "  2   4  ",
                      "   28 793",
                      " 4 16728 ",
                      "2  73 15 ",
                      " 31   97 ",
                      " 75 91  2",
                      " 57842 3 ",
                      "469 75   ",
                      "  8   5  " ]
      @anser = [
                      "782953416",
                      "516284793",
                      "943167285",
                      "294736158",
                      "631528974",
                      "875491362",
                      "157842639",
                      "469375821",
                      "328619547" ]
    end
  
    describe "#start" do
  
      it "sends a started message and initial condition" do
        output = double('output')
        analyzer = Analyzer.new(@initial_condition, output)
        output.should_receive(:puts).with("started analysis.")
        output.should_receive(:puts).with(@initial_condition.join("\n"))
        analyzer.start
      end

    end

    describe "#set" do
      
      before do
        output = double('output')
        @analyzer = Analyzer.new(@initial_condition, output)
      end

      it "should be array case string" do
        @analyzer.set "123456789" * 9
        @analyzer.current.should == %w(123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789)
      end

      it "should be array case array" do
        @analyzer.set %w(123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789)
        @analyzer.current.should == %w(123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789)
      end

    end

    describe "#analyze_left_columns" do

      
      before do
        @before = [
                    "  2   4  ",
                    "   28 793",
                    " 4 16728 ",
                    "2  73 15 ",
                    " 31   97 ",
                    " 75 91  2",
                    " 57842 3 ",
                    "469 75   ",
                    "  8   5  " ]
        @after = [
                    "  2   4  ",
                    "   28 793",
                    " 4 16728 ",
                    "2  73 15 ",
                    " 31   97 ",
                    " 75 91  2",
                    " 57842 3 ",
                    "469 75   ",
                    " 28   5  " ] # ここの2が埋められるはず
        output = double('output')
        @analyzer = Analyzer.new(@initial_condition, output)
      end
      
      it "should be after" do
        @analyzer.set @before
        @analyzer.analyze_left_columns 2
        @analyzer.current.should == @after
      end

    end

  end

end
