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

    assert_equal "00000", bt.translate(" ")
  end

end
