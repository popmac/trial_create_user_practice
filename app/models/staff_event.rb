class StaffEvent < ApplicationRecord
  # typeカラムから特別な意味が失われて、普通のカラムとして使用できる
  self.inheritance_column = nil

  belongs_to :member, class_name: 'StaffMember', foreign_key: 'staff_member_id'
  alias_attribute :occurred_at, :created_at
end
