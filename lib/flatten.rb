##
# Flatten class, flatten an array
#
class Flatten
  attr_accessor :array

  ##
  # Initialize new flatten object, it takes array as argument
  #
  def initialize(arr)
    @array = arr
  end


  ##
  # Flatten an array of arbitrarily nested arrays of integers into a flat array of integers.
  #
  def flat(arr=@array)
    return [] unless arr.is_a?(Array)
    new_arr = []

    arr.each do |item|
      if item.is_a?(Array)
        new_arr += flat(item)
      else
        new_arr << item.to_s.to_i
      end
    end
    return new_arr
  end

end
