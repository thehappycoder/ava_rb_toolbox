require_relative 'module'

module Enumerable
  # Returns a {AvaRbToolbox::Enumerable}
  def ava
    @ava || AvaRbToolbox::Enumerable.new(self)
  end
end

# This class extends functionality of an enumerable
# @author Anton Kuzmin
class AvaRbToolbox::Enumerable
  def initialize(target)
    @target = target
  end

  # Groups enumerable entries by key returned by `proc`
  # into hash where value is an enumerable's entry
  # @return [Hash]
  def group_by_unique(proc)
    result = {}

    return result if proc.nil?

    @target.each_entry do |item|
      result[proc.call(item)] = item
    end

    result
  end
end