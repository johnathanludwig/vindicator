require "vindicator/version"

module Vindicator
  # This method checks that an auto VIN is valid against its check digit

  # Example
  # valid_vin?('1GNEC233X9R191831')

  def self.valid_vin?(vin)
    # I, O, and Q are not valid letters in a VIN. A valid VIN is exactly 17 characters in length
    vin = vin.to_s.downcase.gsub(/(i|o|q|\W|_)/i,'').split('')
    return false if vin.size != 17

    # The 9th character is the check digit
    check_digit = vin[8]

    # Set up the numeric values for alpha characters and the weight for each position in the VIN
    alpha_values = {'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6, 'g' => 7, 'h' => 8,
                    'j' => 1, 'k' => 2, 'l' => 3, 'm' => 4, 'n' => 5,           'p' => 7,           'r' => 9,
                              's' => 2, 't' => 3, 'u' => 4, 'v' => 5, 'w' => 6, 'x' => 7, 'y' => 8, 'z' => 9}
    weight = [8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2]

    total = 0
    vin.each_with_index do |num,index|
      next if index == 8 # skip the check digit
      if num =~ /\d/
        total += num.to_i * weight[index]
      elsif num =~ /[a-z]/
        total += alpha_values[num] * weight[index]
      end
    end

    # The total divided my the remainder should be the same as the check digit.
    # The check digit should be x if the remainder is 10
    remainder = total % 11
    remainder = 'x' if remainder == 10
    check_digit.to_s == remainder.to_s
  end
end
