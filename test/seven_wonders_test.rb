require_relative "test_helper"

describe "lookup_locations" do
  it "will return the locations of the seven wonders" do
    VCR.use_cassette("find_locations") do
      # Arrange
      locations = ["Great Pyramid of Giza", "Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

      # Act
      lat_and_lon = get_locations(locations)

      # Assert
      locations.each do |location|
        expect( lat_and_lon.keys ).must_include location
      end
    end
  end

end