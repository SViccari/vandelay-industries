RSpec.describe ClueFinder do
  describe ".find" do
    it "finds the clue with the matching location" do
      location = "apartment"

      clue = ClueFinder.find(location)

      expect(clue.location).to eq(location)
    end

    context "given an unknown location" do
      it "returns a MissingClue" do
        location = "unknown"

        clue = ClueFinder.find(location)

        expect(clue).to be_a(ClueFinder::MissingClue)
      end
    end
  end
end
