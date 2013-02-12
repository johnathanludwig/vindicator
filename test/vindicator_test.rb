$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'vindicator'
require 'rubygems'
require 'minitest/autorun'

class VindicatorTest < MiniTest::Unit::TestCase
  describe "when using a valid vin" do
    it "returns true " do
      assert Vindicator.valid_vin?('1GNEC233X9R191831'), "valid_vin? returned false when a valid VIN was used"
      assert Vindicator.valid_vin?('2HNYD2H22AH529160'), "valid_vin? returned false when a valid VIN was used"
      assert Vindicator.valid_vin?('2HNYD18683H545668'), "valid_vin? returned false when a valid VIN was used"
      assert Vindicator.valid_vin?('5GZCZ43D13S812715'), "valid_vin? returned false when a valid VIN was used"
      assert Vindicator.valid_vin?('11111111111111111'), "valid_vin? returned false when a valid VIN was used"
    end

    it 'strips out non alphanumeric characters' do
      assert Vindicator.valid_vin?('1GN-EC2_33X!9R1@918#31'), "valid_vin? returned false when a valid VIN was used"
    end
  end

  describe "when using invalid vins" do
    it 'returns false when vin is not 17 characters in length' do
      # too long
      assert !Vindicator.valid_vin?('2HNYD2H22AH529160W'), "valid_vin? returned true when an invalid VIN was used"
      # too short
      assert !Vindicator.valid_vin?('2HNYD2H22AH52916'), "valid_vin? returned true when an invalid VIN was used"
    end

    it 'strips out I, O, and Q' do
      assert !Vindicator.valid_vin?('2HNYD2H22AH52916O'), "valid_vin? returned true when an invalid VIN was used"
      assert !Vindicator.valid_vin?('2HNYD2H22AH52916I'), "valid_vin? returned true when an invalid VIN was used"
      assert !Vindicator.valid_vin?('2HNYD2H22AH52916Q'), "valid_vin? returned true when an invalid VIN was used"
    end

    it "returns false when the check digit does not match" do
      assert !Vindicator.valid_vin?('TGZCZ43D13S812715'), "valid_vin? returned true when an invalid VIN was used"
      assert !Vindicator.valid_vin?('11111111211111111'), "valid_vin? returned true when an invalid VIN was used"
    end
  end
end
