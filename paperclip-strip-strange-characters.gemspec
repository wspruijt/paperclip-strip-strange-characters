$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |s|
  s.name              = "paperclip-strip-strange-characters"
  s.version           = '0.0.3'
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Strip strange characters from Paperclip upload"
  s.homepage          = "http://github.com/wspruijt/paperclip-strip-strange-characters"
  s.email             = "willem.spruijt@gmail.com"
  s.authors           = [ "Willem Spruijt" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")
  s.files            += Dir.glob("test/**/*")

#  s.executables       = %w( paperclip-strip-strange-characters )
  s.description       = <<desc
  Strip strange characters from Paperclip upload
desc
end
