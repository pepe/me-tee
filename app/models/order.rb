class Order
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :name
  field :street
  field :city
  field :zip
  field :email
  field :phone
  field :note
  field :coupon
  field :hobby
  field :face
  field :job
  field :gender
  field :size
  
  validates_presence_of :email, :name, :street, :city, :phone, :hobby, :face,
    :job, :gender, :size

end
