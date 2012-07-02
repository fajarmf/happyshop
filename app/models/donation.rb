class Donation < ActiveRecord::Base
  attr_accessible :description, :percentage, :pickup_date, :user_id, :image, :address

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                            :default_url => '/assets/default_product.png',
                            :path => "/:style/:hash.:extension",
                            :hash_secret => "hash.secret",
                            :storage => 's3', :s3_credentials => "#{Rails.root}/config/s3.yml"
end
