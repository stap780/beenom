class Itemimage < ActiveRecord::Base

  acts_as_list
	belongs_to :item

	has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>" },
    :path => ":rails_root/public/system/images/itemimages/:id/:style/:basename.:extension",
    :url  => "/system/images/itemimages/:id/:style/:basename.:extension"

	validates_attachment :image,
                     content_type: { content_type: /\Aimage\/.*\z/ },
                     size: { less_than: 5.megabyte }


end
