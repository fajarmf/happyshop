class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :sell, :vendor_user_id, :image

  validates_presence_of :name, :price, :description, :vendor_user_id
  validates :sell, :inclusion => { :in => [true, false] }

  validates_length_of :name, :maximum => 50
  validates_length_of :description, :maximum => 1024

  validates_each :price do |resource, attr, value|
    value = value.to_f
    resource.errors.add(attr, 'must be between $0 and $100') unless value > 0 and value < 100
    resource.errors.add(attr, 'cannot have thousandths of a cent') unless (value * 100) == (value * 100).to_i
  end

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                            :path => "/:style/:hash.:extension",
                            :hash_secret => "hash.secret",
                            :storage => 's3', :s3_credentials => "#{Rails.root}/config/s3.yml"
end
