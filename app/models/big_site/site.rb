module BigSite
  class Site < ApplicationRecord

    validates_uniqueness_of :domain, :case_sensitive => false
    
    def self.find_by_host_name(host)
      host.downcase!

      # the subdomain is optional and will be nil in md[1] if it's not provided.
      if md = host.match(/(?:([-\w]*)\.)?(\w*)\.([a-z]{2,6})$/i)
        subdomain = md[1]
        domain = md[2]
        tld = md[3]
        root = domain + "." + tld
      else
        return nil
      end
 
      if site = BigSite::Site.find_by("LOWER(domain) = ?", host) 
        site
      elsif (site = BigSite::Site.find_by("LOWER(domain) in (?)", ["www.#{root}", root]) )
        # If the request is for domain.com but the custom_domain entered as
        # www.domain.com. If the request is for randomsubdomain.domain.com then we
        # want to return www.domain.com or domain.com only.
        site
      else
        nil
      end
    end

  end
end
