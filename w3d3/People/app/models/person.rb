class Person
  validate :name, presence: true

  belongs_to :house
    foreign_key: :house_id
    primary_key: :id
    class_name: :House
end
