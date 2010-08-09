class Icon
  include Mongoid::Document
  include Mongoid::Timestamps

  field :label
  field :filename
  field :type

  key :type, :label

  belongs_to_related :design

  scope :hobbies, where(:type => 'hobby')
  scope :faces, where(:type => 'face')
  scope :jobs, where(:type => 'job')

  # returns path for web printing
  def path
    @path ||= "/icons/#{filename}"
  end

  # returns full name with type
  def full_name
    @full_name ||= "%s %s" % [type, label]
  end

  class << self
    # returns random icon id by type
    def random(type)
      Icon.only(:id).where(:type => type).map(&:id).random_element
    end

  end
end
