# frozen_string_literal: true
require 'minitest/autorun'
require 'base32'
require 'sprockets/digest_utils'

class TestDigestUtilsBase32 < MiniTest::Test
  include Sprockets::DigestUtils

  def test_detect_digest_class
    base32 = Base32.encode("chunky bacon!")[..7]

    assert_equal Base32, detect_digest_class(base32)
  end

  def test_already_digested
    refute already_digested?("applicationABC10000")

    assert already_digested?("application-" + Base32.encode("chunky bacon!")[..7])
  end
end
