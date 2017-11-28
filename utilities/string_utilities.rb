class String
    def intersection(compared_to)
        common_chars = (self.split('') & compared_to.split(''))
        common_chars.inject(0) { |result, char|
          result + [self.count(char), compared_to.count(char)].min
        }
    end
end