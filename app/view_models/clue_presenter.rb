class CluePresenter < SimpleDelegator
  def formatted_text
    [text].join("\n")
  end
end
