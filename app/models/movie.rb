class Movie < ActiveRecord::Base


  has_many :reviews
  mount_uploader :image, ImageUploader 

  validates :title,
            presence: true
  validates :director,
            presence: true
  validates :runtime_in_minutes,
            numericality: { only_integer: true }
  validates :description,
            presence: true
  validates :poster_image_url,
            presence: true
  validates :release_date,
            presence: true
  validate :release_date_is_in_the_future

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size >= 1
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ? OR director like ?", "%#{query}%", "%#{query}%") 
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end

end
