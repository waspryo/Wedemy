class Video < ApplicationRecord
  def next
    Video.where("id > ?", id).first
  end

  def prev
    Video.where("id < ?", id).last
  end

end
