class ClueFinder
  def self.find(location)
    new(location).find
  end

  def initialize(location)
    @location = location
  end

  def find
    find_by_location || MissingClue.new(location)
  end

  private

  attr_reader :location

  def find_by_location
    Clue.all.find { |clue| clue.location == location }
  end

  class MissingClue
    def initialize(location)
      @location = location
    end

    def text
      "Sorry, no clue lives here"
    end

    def video_url
      "https://www.youtube.com/embed/EQnaRtNMGMI"
    end
  end
end
