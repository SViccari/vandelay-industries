RSpec.describe YamlFixture do
  describe ".load" do
    it "returns the yaml file contents as a list of hashes" do
      yaml = <<~YAML
        -
          command: greet
          response: hello
      YAML

      file = build_file(yaml)

      results = YamlFixture.load(file)

      expect(results).to eq([{
        "command" => "greet",
        "response" => "hello"
      }])
    end

    it "parses yaml with erb" do
      yaml = <<~YAML
        -
          command: add
          response: <%= 1 + 1 %>
      YAML

      file = build_file(yaml)

      results = YamlFixture.load(file)

      expect(results).to eq([{
        "command" => "add",
        "response" => 2
      }])
    end
  end

  def build_file(contents)
    tmp_file = Tempfile.new("tmp.yml")
    tmp_file << contents
    tmp_file.rewind
    tmp_file
  end
end
