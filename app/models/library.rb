class Library < ActiveRecord::Base
  attr_accessible :description, :name, :versions_attributes, :uris_attributes
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  validates_format_of :name, :with => /^[-_a-z\d]+$/, :message => "is not formatted correctly"
  belongs_to :user
  has_many :versions, :dependent => :destroy
  accepts_nested_attributes_for :versions, :reject_if => lambda { |a| a[:version].blank? }, :allow_destroy => true
  attr_reader :keywords
  def keywords
    "#{name} #{description.gsub(/<[^>]+>/,'').gsub(/[\r\n]+/, ' ')} #{user.name}".split(/[\s[[:punct:]]]+/).uniq.join(' ')
  end
end
