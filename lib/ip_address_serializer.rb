require 'ip'
require "ip_address_serializer/version"

DELIMITER = '^'

module IPAddressSerializer
	
	# Load the value and return the IP Object.
	# @param [String] value String representation of the IP Object
	# @return [IP] The IP Object (from ruby-ip)
	def self.load(value)
		if value.nil?
			return nil
		end
		if value.is_a?(String) && value.index(DELIMITER) > 0
			return IP.new(value.split(DELIMITER))
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
		return [ip.proto, ip.to_hex, ip.pfxlen].join(DELIMITER)
	end
end
