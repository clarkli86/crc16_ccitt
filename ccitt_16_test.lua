-- Unit test for frame class
-- Author: Clark Li <clark.li86@gmail.com>
-- Test data generated from zroc.breitbandkatze.de/crc.html - ccitt
require "lunit.lunit"
require "ccitt_16"

module("ccitt_16_test", lunit.testcase, package.seeall)

function test_success()
  assert_true(true, "always success")
end

function test_crc_short()
  -- Test data generated from zroc.breitbandkatze.de/crc.html - ccitt
  compute_crc(0x29b1, "123456789")
end

function test_crc_long()
  compute_crc(0x9487, "1234567890abcdefghijklmnopqrstuvwxyz")
end

function test_crc_super_long()
  compute_crc(0xace8, "1234567890abcdefghijklmnopqrstuvwxyz0000fffffffffffffffffffffffffffffffffffffffffffffffffffffffaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaeeeeeeeee00adfadfaldfjakhflakjflahsdflahldfjaksdhflahkldfhalkfklajlfahlkhdflajdlfjasldjfklaldfhalsdjflajflahslkhfklahdflkadf")
end

function compute_crc(crc, s)
  local data = {}
  for i = 1, #s do data[#data + 1] = string.byte(s, i) end -- convert string to table
  assert_equal(crc, ccitt_16(data))
end
