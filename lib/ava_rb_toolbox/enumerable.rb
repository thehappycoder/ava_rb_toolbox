require_relative 'module'

module Enumerable
  # Returns a {AvaRbToolbox::Enumerable}
  def ava
    @ava ||= AvaRbToolbox::Enumerable.new(self)
  end
end

# This class extends functionality of an enumerable
# @author Anton Kuzmin
class AvaRbToolbox::Enumerable
  def initialize(target)
    @target = target
  end

  # Groups enumerable entries by key returned by `proc` or `block`
  # into hash where value is an enumerable's entry.
  #
  # If `block` is given, `proc` is ignored.
  #
  # @return [Hash]
  def group_by_unique(proc = nil, &block)
    result = {}

    return result if proc.nil? and !block_given?

    proc = block if block_given?

    @target.each_entry do |item|
      result[proc.call(item)] = item
    end

    result
  end
end