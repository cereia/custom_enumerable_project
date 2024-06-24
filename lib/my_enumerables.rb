# frozen_string_literal: true

# custom enumerables
module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield element, index
      index += 1
    end
    self
  end

  def my_select
    selected = []
    my_each { |element| selected << element if yield element }
    selected
  end

  def my_all?
    all = true
    my_each { |element| all = false unless yield element }
    all
  end

  def my_any?
    any = false
    my_each { |element| any = true if yield element }
    any
  end

  def my_none?
    none = true
    my_each { |element| none = false if yield element }
    none
  end

  def my_count
    i = 0
    if block_given?
      my_each { |element| i += 1 if yield element }
      i
    else
      length
    end
  end

  def my_map
    mapped = []
    my_each { |element| mapped << yield(element) }
    mapped
  end

  def my_inject(initial_value)
    result = initial_value
    my_each { |element| result = yield(result, element) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return unless block_given?

    length.times { |i| yield self[i] }
    self
  end
end
