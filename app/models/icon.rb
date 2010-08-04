class Icon
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :name
  field :filename
  field :type
  
  key :type, :name

  scope :hobbies, where(:type => 'hobby')
  scope :faces, where(:type => 'face')
  scope :jobs, where(:type => 'job')

  # returns path for web printing
  def path
    @path ||= "/icons/#{filename}"
  end

  # returns full name with type
  def full_name
    @full_name ||= "%s %s" % [type, name]
  end
end
