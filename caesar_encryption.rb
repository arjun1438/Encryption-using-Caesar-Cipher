class CaesarEncryption
    attr_reader :shift_offset

    def initialize (shift_offset)
        @shift_offset = shift_offset
    end    

    def encrypt (input_str)
        encrypted_char_arr = Array.new
        encrypted_char_arr = input_str.split("").map do |char|
            ascii_val = char.ord
            if ascii_val.between?(65,90)
                ascii_val += shift_offset
                if ascii_val > 90
                    ascii_val = (ascii_val - 90) % 26 + 64
                end

            elsif ascii_val.between?(97,122)
                ascii_val += shift_offset
                if ascii_val > 122
                    ascii_val = (ascii_val - 122) % 26 + 96
                end
            end
            ascii_val.chr
        end
        encrypted_char_arr.join

    end
end

encrypter = CaesarEncryption.new(4)
puts encrypter.encrypt("Arjun")

