require 'openssl'

data = "Very, very confidential data"

class SecureData
 def self.encrypt(data)
   cipher = OpenSSL::Cipher::AES.new(128, :CBC)
   cipher.encrypt
   @key = cipher.random_key
   @iv = cipher.random_iv

   encrypted = cipher.update(data) + cipher.final
 end
 def self.decrypt(encrypted)
   decipher = OpenSSL::Cipher::AES.new(128, :CBC)
   decipher.decrypt
   decipher.key = @key
   decipher.iv  = @iv

   plain = decipher.update(encrypted) + decipher.final
 end
end

puts SecureData.encrypt(data)

# Doctor login
# Patience visits
# What is your surname? gets.chomp

puts SecureData.decrypt(SecureData.encrypt(data))