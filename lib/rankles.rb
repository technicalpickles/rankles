require 'active_support'
module Rankles
  class Reddit
    attr_accessor :date, :upvotes, :downvotes

    # Setup data for ranking calculation. Required options:
    # * <tt>:date</tt>
    # * <tt>:upvotes</tt>
    # * <tt>:downvotes</tt>
    def initialize(options = {})
      self.date      = options[:date]
      self.upvotes   = options[:upvotes]
      self.downvotes = options[:downvotes]
    end

    # http://www.seomoz.org/img/upload/reddit_cf_algorithm.png 
    #
    # Gives the result of the reddit algorithm. Higher is better.
    def to_f
      ts = date - Time.utc(2005, 12, 8, 7, 46, 43)
      x = upvotes - downvotes

      y = case
          when x > 0  then 1
          when x == 0 then 0
          when x < 0  then -1
          end

      z = if x.abs >= 1
            x.abs
          else
            1
          end

      Math.log10(z) + (y * ts) / 12.5.hours
    end
  end
end
