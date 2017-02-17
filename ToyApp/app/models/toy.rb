class Toy < ActiveRecord::Base
  validates :name, :toyable_id, :toyable_type, uniqueness: true

  belongs_to :toyable, polymorphic: true

  

end
