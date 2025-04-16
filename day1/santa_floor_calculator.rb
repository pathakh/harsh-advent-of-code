# frozen_string_literal: true

# day 1 of year 2015
module Day1
  class SantaFloorCalculator
    class InvalidInstructionError < StandardError; end

    VALID_INSTRUCTIONS_REGEX = /^[()]*$/

    def self.call(instructions)
      return 0 if instructions.to_s.empty?

      raise InvalidInstructionError unless VALID_INSTRUCTIONS_REGEX.match?(instructions.to_s)

      up_moves = instructions.count('(')
      down_moves = instructions.count(')')
      up_moves - down_moves
    end
  end
end
