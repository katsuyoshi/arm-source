# -*- coding:utf-8 -*-
class Output
  def messages
    @message ||= []
  end

  def puts(message)
    messages << message
  end
end


def output
  @output ||= Output.new
end

initial_condition = [ "  2   4  ",
                      "   28 793",
                      " 4 16728 ",
                      "2  73 15 ",
                      " 31   97 ",
                      " 75 91  2",
                      " 57842 3 ",
                      "469 75   ",
                      "  8   5  " ]

Given(/^コンストラクタに問題を与える$/) do
  @analyzer = Sudoku::Analyzer.new(initial_condition, output)
end

When(/^#startを呼び出すと$/) do
  @analyzer.start
end

Then(/^問題 "(.*?)"　が表示される。$/) do |message|
  output.messages.should include(message.gsub('\n', "\n"))
end

Given(/^現在の状態"(.*?)"を与える$/) do |arg1|
  @analyzer = Sudoku::Analyzer.new(nil, output)
  @analyzer.set arg1.gsub("*", " ")
end

When(/^\#analize_left_columns"(.*?)" を呼び出すと$/) do |arg1|
  @analyzer.analyze_left_columns arg1
end

Then(/^次の状態"(.*?)"にになること。$/) do |arg1|
  @analyzer.current.join("").should == arg1.gsub("*", " ")
end
