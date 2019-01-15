# frozen_string_literal: true

class NumberSanitizer
  def self.sanitize(number)
    parse_number = Phonelib.parse(number)
    result = parse_number.e164
    return result if result.nil? || result.length < 11

    result = '+1' + result.sub('+', '') if result.length == 11
    result
  end
end
