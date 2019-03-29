class Item < ActiveRecord::Base
  belongs_to :user
  has_many	 :itemimages, :dependent => :destroy
  accepts_nested_attributes_for :itemimages, allow_destroy: true

  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true

end
