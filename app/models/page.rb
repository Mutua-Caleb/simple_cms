class Page < ApplicationRecord
  
  acts_as_list :scope => :subject


  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)} 
  scope :sorted, lambda {order('Position ASC')}
  scope :newest_first, lambda {order('created_at DESC')}
  scope :search, lambda {|query|  where("name LIKE ?", "%#{query}%")}

  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  #use presence_of with :length_of  to disallow spaces 
  validates_uniqueness_of :permalink
  #for unique values by subject use

end
