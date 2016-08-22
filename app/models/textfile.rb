class Textfile < ApplicationRecord

  def self.content_for(filename)
    self.find_by(filename: params[:filename]).content
  end

end
