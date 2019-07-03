RSpec.describe ClueBuilder do
  describe ".all" do
    it "maps the commands config file to Command objects" do
      fixture_file = file_fixture("clues.yml")

      commands = ClueBuilder.all(fixture_file: fixture_file)

      command = commands.first

      expect(command).to be_a(Clue)
      expect(command.location).to eq(fixture_command["location"])
      expect(command.video_url).to eq(fixture_command["video_url"])
      expect(command.text).to eq(fixture_command["text_html"])
    end
  end

  def fixture_command
    parsed_commands.first
  end

  def parsed_commands
    file = file_fixture("clues.yml")
    YAML.load(file.read)
  end
end
