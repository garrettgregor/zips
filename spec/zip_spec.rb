require "./lib/zip"

RSpec.describe Zip do
  let!(:path) { '/Users/garrettgregor/coding/rails_conf_2024/zips/fixtures/uszips.csv' }
  let!(:instance) { Zip.new(path) }

  describe "#initialize" do
    it "creates a new instance of Zip" do
      expect(instance).to be_a(Zip)
      expect(instance.file_path).to eq(path)
    end
  end

  describe "#make_zips" do
    it "should generate a hash map with real us states and territories as keys" do
      expect(instance.make_zips).to be_a(Hash)
      expect(instance.make_zips.keys.count).to eq(56)
    end

    it "has 5 digit zips for all states" do
      states = instance.make_zips.keys

      states.each do |state|
        zips = instance.make_zips[state]
        zips.each do |zip|
          expect(zip.length).to eq(5)
        end
      end
    end
  end
end
