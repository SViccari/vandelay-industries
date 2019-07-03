class YamlFixture
  def self.load(file)
    new(file).contents
  end

  def initialize(file)
    @file = file
  end

  def contents
    @_contents ||= YAML.load(parsed_erb_yaml)
  end

  private

  attr_reader :file

  def parsed_erb_yaml
    ERB.new(file.read).result
  end
end
