module HtmlHelper
  def nl2br(text)
    text.gsub(/\r\n|\r|\n/, '<br>')
  end

  def nl2br_h(text)
    nl2br(h(text))
  end
end
