class Picture < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :picture,
                    :styles => {:medium => "600x600>", :thumb => "200x200>" }

  validates_attachment_content_type :picture,
                                    :content_type => /^image\/(png|gif|jpeg)/,
                                    :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'

  validates_attachment_size :picture,
                            :in	=> 0..150.kilobytes,
                            :message => '--- za duży plik max rozmiar to 150 kB ----'

end
