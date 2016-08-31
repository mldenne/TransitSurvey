class Textfile < ApplicationRecord

  def self.content_for(filename)
    Kramdown::Document.new(self.find_by(filename: filename).content).to_html.html_safe
  end

end
