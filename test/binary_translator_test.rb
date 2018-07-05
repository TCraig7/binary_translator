require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_translator'

class BinaryTranslatorTest < Minitest::Test

  def test_it_exists
    bt = BinaryTranslator.new

    assert_instance_of BinaryTranslator, bt
  end

  def test_it_can_translate
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "011010", bt.translate("z")
    assert_equal "010100010101010010001001001110000111", bt.translate("turing")
  end

  def test_it_can_translate_capital_letters
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("A")
    assert_equal "010100010101010010001001001110000111", bt.translate("turing")
    assert_equal "010100010101010010001001001110000111", bt.translate("TURING")
  end

  def test_it_can_translate_spaces
    bt = BinaryTranslator.new

    assert_equal "000000", bt.translate(" ")
  end

  def test_it_does_not_translate_symbols
    bt = BinaryTranslator.new

    expected = "001000000101001100001100001111000000010111001111010010001100000100"

    assert_equal "", bt.translate("!")
    assert_equal "", bt.translate("!@{$#%^&*()}")
    assert_equal expected, bt.translate("Hello World!")
  end

  def test_it_can_translate_from_binary_to_alpha
    bt = BinaryTranslator.new

    message_1 = "001000000101001100001100001111000000010111001111010010001100000100"

    message_2= "000000000000001000000101001100001100001111000000000000010111001111010010001100000100000000000000"

    assert_equal "hello world", bt.translate_to_text(message_1)
    assert_equal "  hello  world  ", bt.translate_to_text(message_2)
  end

end
