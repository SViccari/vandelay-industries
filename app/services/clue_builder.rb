class ClueBuilder
  def self.all(fixture_file: Rails.root.join("config/clues.yml"))
    new(fixture_file).all
  end

  def all
    fixture_clues.map do |clue|
      Clue.new(
        location: clue["location"],
        video_url: clue["video_url"],
        text: clue["text_html"]
      )
    end
  end

  def initialize(fixture_file)
    @fixture_file = fixture_file
  end

  private

  attr_reader :fixture_file

  def fixture_clues
    YamlFixture.load(fixture_file)
  end
end
