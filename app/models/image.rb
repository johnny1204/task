class Image < ApplicationRecord
  TITLE_LENGTH = 30

  validates :title, presence: true, length: { maximum: TITLE_LENGTH }
  validates :file, presence: { message: 'が選択されていません' }

  belongs_to :user

  attr_accessor :file

  def image_path
    Pathname.new('/upload').join(user.id.to_s).join(file_name).to_path
  end

  def upload_dir
    Rails.root.join('public', 'upload', user.id.to_s)
  end
end
