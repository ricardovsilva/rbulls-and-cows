class String
  def intersection_chars(target)
    common_chars = (self.split('') & target.split(''))
  end

  def exact_intersection_chars(target)
    return 0 if self == nil or target == nil or self.length == 0 or target.length == 0

    smaller = self.length < target.length ? self : target
    bigger = self.length >= target.length ? self : target

    result = []
    smaller.each_char.with_index do |letter, index|
      result.push({letter: letter, position: index}) if smaller[index] == bigger[index]
    end

    return result
  end
end