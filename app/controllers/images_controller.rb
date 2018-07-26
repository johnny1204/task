class ImagesController < ApplicationController
  before_action :check_login

  def index
    @images = current_user.images
  end

  def new
    @image = current_user.images.build
  end

  def create
    @image = current_user.images.build
    @image.assign_attributes(image_params)
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  private

    def image_params
      image_params = params.require(:image).permit(:title)
      file = params[:image][:file]
      if file.present?
        image = file.read
        file_name = save_image(image, file.original_filename)
        image_params.merge!(file: image, file_name: file_name)
        image_params.permit(:file, :file_name)
      end

      image_params
    end

    def save_image(image_file, origin_name)
      file_dir = @image.upload_dir
      FileUtils.mkdir_p(file_dir)
      file_name = "#{SecureRandom.hex(10)}_#{origin_name}"
      File.open(file_dir.join(file_name), 'w+b') do |file|
        file.write(image_file)
      end

      file_name
    end
end
