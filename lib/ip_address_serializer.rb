require 'ip'
require "ip_address_serializer/version"

DELIMITER = '^'.freeze
V4DELIMITER = '~'.freeze
V6DELIMITER = ':'.freeze
CTXDELIMITER = '%'.freeze

module IPAddressSerializer
	# Load the value and return the IP Object.
	# @param [String] value String representation of the IP Object
	# @return [IP] The IP Object (from ruby-ip)
	def self.load(value)
		if value.nil?
			return nil
		end
    ctext = nil
    if value.is_a?(String) && value.index(CTXDELIMITER)
      ctext = value.split(CTXDELIMITER)[1]
      value = value.split(CTXDELIMITER)[0]
    end
		if value.is_a?(String) && value.index(DELIMITER)
      if value[1] == '4' && value.index(V4DELIMITER)
        value = value.gsub(V4DELIMITER,"")
      end
      if value[1] == '6' && value.index(V6DELIMITER)
        value = value.gsub(V6DELIMITER,"")
      end
			ip = IP.new(value.split(DELIMITER))
      if ctext
        ip.ctx = ctext
      end
      return ip
		end
	end

	# Save the value, which converts either a String, or an IP Object to the String representation for storage
	# @param [String, IP, IP::V4, IP::V6] String representation, or internal IP representation of an IP Address
	# @return [String] The encoded string value representing the IP address object
	def self.dump(value)
		if value.nil?
			return nil
		end
		if value.is_a?(String)
			ip = IP.new(value)
		elsif (value.is_a?(IP) || value.is_a?(IP::V4) || value.is_a?(IP::V6))
			ip = value
		end
    address = nil
    if ip.proto == "v4"
      rawhex = ip.to_hex
      address = rawhex[0..1]+V4DELIMITER+rawhex[2..3]+V4DELIMITER+rawhex[4..5]+V4DELIMITER+rawhex[6..7]
    end
    if ip.proto == "v6"
      rawhex = ip.to_hex
      address = rawhex[0..3]+V6DELIMITER+rawhex[4..7]+V6DELIMITER+rawhex[8..11]+V6DELIMITER+rawhex[12..15]+V6DELIMITER+rawhex[16..19]+
        V6DELIMITER+rawhex[20..23]+V6DELIMITER+rawhex[24..27]+V6DELIMITER+rawhex[28..31]
    end
    if ip.ctx.nil?
      return [ip.proto, address, ip.pfxlen].join(DELIMITER)
    else
      ctext = CTXDELIMITER+ip.ctx.to_s
      return [ip.proto, address, ip.pfxlen, ctext].join(DELIMITER)
    end
	end
end
