require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rankles::Reddit do
  it "should not blow up" do
    reddit = Rankles::Reddit.new :date => Time.now, :upvotes => 0, :downvotes => 0
    reddit.to_f
  end
end
