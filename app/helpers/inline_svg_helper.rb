require 'nokogiri'
module InlineSvgHelper
  def the_inline_svg(path, css="")
    doc = Nokogiri::XML(File.read(path))
    svg = doc.at_css "svg"
    svg['class'] = "#{css}"
    return raw doc
  end
end