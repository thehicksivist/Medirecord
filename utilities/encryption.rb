require 'openssl'

class SecureData

  attr_reader :key, :iv
  def initialize
    # @cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    # @key = @cipher.random_key
    # @iv = @cipher.random_iv

    puts "Keysss...."
    puts @key
    puts @iv
  end

 def self.encrypt(data)
   cipher = OpenSSL::Cipher::AES.new(128, :CBC)
   @key  = cipher.random_key
   @iv  = cipher.random_iv
   cipher.encrypt

   encrypted = cipher.update(data) + cipher.final
 end
 def self.decrypt(encrypted, key,iv)
   decipher = OpenSSL::Cipher::AES.new(128, :CBC)
   decipher.decrypt
   decipher.key = @key
   decipher.iv  = @iv

   plain = decipher.update(encrypted) + decipher.final
 end
end

