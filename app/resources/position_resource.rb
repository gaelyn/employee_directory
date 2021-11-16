class PositionResource < ApplicationResource
  filter :employee_id, :integer
  attribute :title, :string
  attribute :active, :boolean
end
