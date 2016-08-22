class Textfile < ApplicationRecord

  def self.content_for(filename)
    self.find_by(filename: filename).content
  end

end
