# frozen_string_literal: true

module Day11
  class PasswordGenerator
    class InvalidExistingPassword < StandardError; end

    attr_reader :password

    def initialize(password)
      @password = password
    end

    def call
      if @password.length != 8 || contains_invalid_characters?(@password)
        raise InvalidExistingPassword, "Initial password invalid: #{@password}"
      end

      loop do
        @password = increment_password(@password)
        break if is_valid?(@password)
      end

      @password
    end

    private

    def contains_invalid_characters?(pwd)
      pwd.chars.any? { |char| %w[i o l].include?(char) } || !@password.match?(/^[a-z]+$/)
    end

    def increment_password(pwd)
      chars = pwd.chars
      idx = chars.length - 1

      while idx >= 0
        if chars[idx] == 'z'
          chars[idx] = 'a'
          idx -= 1
        else
          chars[idx] = chars[idx].succ
          if %w[i o l].include?(chars[idx])
            # https://ruby-doc.org/core-2.5.7/String.html#method-i-next
            chars[idx] = chars[idx].succ
          end
          break
        end
      end
      chars.join
    end

    def contains_straight?(pwd)
      pwd.chars.each_cons(3).any? do |a, b, c|
        b == a.succ && c == b.succ
      end
    end

    def contains_two_pairs?(password)
      pairs_found = []
      i = 0

      while i < password.length - 1
        if password[i] == password[i+1]
          pairs_found << password[i]
          i += 2
        else
          i += 1
        end
      end

      unique_pairs = pairs_found.uniq
      unique_pairs.length >= 2
    end

    def is_valid?(pwd)
        contains_straight?(pwd) && contains_two_pairs?(pwd)
    end
  end
end