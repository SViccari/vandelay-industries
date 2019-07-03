class Clue
  attr_reader :location, :video_url, :text

  def self.all
    ClueBuilder.all
  end

  def initialize(location:, video_url:, text:)
    @location = location
    @video_url = video_url
    @text = text
  end
end
