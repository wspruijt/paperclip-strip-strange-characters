# encoding: utf-8
require 'iconv'
require 'digest/md5'

class String
  def strip_strange_characters(hash = true)
    # Escape str by transliterating to UTF-8 with Iconv
    s = self.delete!("^\u{0000}-\u{007F}")
    
    # Downcase string
    s.downcase!

    # Remove apostrophes so isn't changes to isnt
    s.gsub!("'", '')

    # Remove quotes 
    s.gsub!("\"", '')

    # Replace any non-letter or non-number character with a space
    s.gsub!(/[^A-Za-z0-9]+/, ' ')

    # Remove spaces from beginning and end of string
    s.strip!

    # Replace groups of spaces with single hyphen
    s.gsub!(/\ +/, '-')
    
    if hash and s == ""
      return Digest::MD5.hexdigest(self) # Fallback - better MD5 than nothing
    end

    return s
  end
end  

module ActiveRecord
  class Base
    protected
      def strip_strange_characters_from_attachments
        if self.attachment_definitions
          self.attachment_definitions.each do |k,v|
            if self.send(k).file?
              full_file_name = self.send("#{k}_file_name")
              extension = File.extname(full_file_name)
              file_name = full_file_name[0..full_file_name.size-extension.size-1]

              self.send("#{k}").instance_write(:file_name, "#{file_name.strip_strange_characters}.#{extension.strip_strange_characters}")
            end
          end
        end
      end
  end
end
