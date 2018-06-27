class Product < ActiveRecord::Base
  belongs_to :category
  has_many :orders, class_name: "Order"

  has_attached_file :picture,
                    :styles => {:medium => "600x600>", :thumb => "200x200>"}

  validates_attachment_content_type :picture,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'

  validates_attachment_size :picture,
                            :in => 0..850.kilobytes,
                            :message => '--- za duży plik max rozmiar to 850 kB ----'

  scope :sortuj, lambda {order("products.Name ASC")}


end



