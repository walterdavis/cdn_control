class Version < ActiveRecord::Base
  attr_accessible :library, :version, :uris_attributes
  belongs_to :library
  has_many :uris, :dependent => :destroy
  accepts_nested_attributes_for :uris, :reject_if => lambda { |a| a[:file].blank? && a[:file_name].blank? && a[:make_link].blank? }, :allow_destroy => true
  default_scope order('id DESC')
end
