require 'test_helper'

class IPV4_dump < MiniTest::Test

  def setup
    @ip4 = IP.new("192.168.1.1")
    @ip4s = "192.168.1.1"
    @ip4c = IP.new("192.168.1.1@foo")
  end

  def test_ipv4_dump_from_ip
    assert_equal "v4^c0~a8~01~01^32", IPAddressSerializer.dump(@ip4)
  end

  def test_ipv4_load_to_ip
    assert_equal IP.new("192.168.1.1"), IPAddressSerializer.load("v4^c0~a8~01~01^32")
  end

  def test_ipv4_dump_from_string
    assert_equal "v4^c0~a8~01~01^32", IPAddressSerializer.dump(@ip4s)
  end

  def test_ipv4_load_legacy_to_ip
    assert_equal IP.new("192.168.1.1"), IPAddressSerializer.load("v4^c0a80101^32")
  end

  def test_ipv4_context_dump_from_ip
    assert_equal "v4^c0~a8~01~01^32^%foo", IPAddressSerializer.dump(@ip4c)
  end

  def test_ipv4_format_upgrade_v1_to_v2
    assert_equal "v4^c0~a8~01~01^32", IPAddressSerializer.dump(IPAddressSerializer.load("v4^c0a80101^32"))
  end

end

