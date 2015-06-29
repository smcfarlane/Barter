require 'digest/md5'
module ApplicationHelper

  def gravatar_url email, size = nil
    size_url = size ? '&s=' + size.to_s : ''
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}.png?d=identicon#{size_url}"
  end

end
