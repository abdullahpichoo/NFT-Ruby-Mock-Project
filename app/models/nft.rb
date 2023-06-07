class Nft < ApplicationRecord
  # mount_uploader :images, ImageUploader
  # serialize :images, JSON # If you use SQLite, add this line.
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 100 },
                    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
  validates :image, presence: true

  has_many :carts, through: :orderables
  has_many :orderables, dependent: :destroy

  belongs_to :wallet
  # after_save_commit :optimize_image
  # before_create :preprocess_image

  private

  def preprocess_image
    return unless image.attached?

    image_path = image.blob.tempfile.path
    puts "\n\n\n\n\n\nimage_path #{image_path}\n\n\n\n\n\n\n"

    # Process the image using Libvips
    processed_image = ImageProcessing::Vips.source(image_path)   
    processed_image = processed_image.convert('jpeg').saver(subsample_mode: 'on', strip: true, interlace: true, quality: 90).call
    
    # Remove the old attachment
    image.purge 

    # # Generate a unique filename by concatenating the current time with the original filename
    current_time = Time.now.strftime('%Y%m%d%H%M%S')
    new_filename = "#{current_time}_#{name}_file"

    # Attach the optimized image to the nft image attachment
    image.attach(io: processed_image, filename: new_filename)
  end

  def optimize_image 
    # Optimize the image before attaching it to the NFT model
    # Load the image using ImageProcessing gem
    raise
    image = ImageProcessing::Vips.source(image)
    # Optimize the image (e.g., resize, compress, etc.) using ImageProcessing methods
    optimized_image = image.convert('jpeg').saver(subsample_mode: 'on', strip: true, interlace: true, quality: 90).call 

     # # Generate a unique filename by concatenating the current time with the original filename
    current_time = Time.now.strftime('%Y%m%d%H%M%S')
    new_filename = "#{current_time}_#{name}_file"

    # Attach the optimized image to the user's profile picture attachment
    image.attach(io: optimized_image, filename: new_filename)        

  end
end
