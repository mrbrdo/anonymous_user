class AnonymousUser < ActiveRecord::Base
  
  def self.get ip, cookies
    u = self.find_by_ip(ip)
    if !u && cookies["anon_user_token"]
      u = self.find_by_cookie_token(cookies["anon_user_token"])
    end
    unless u
      cookies["anon_user_token"] = Time.now.to_i.to_s + rand(1000).to_s + "_" + ip
      u = self.create({:ip => ip, :cookie_token => cookies["anon_user_token"]})
    end
    u
  end
  
end
