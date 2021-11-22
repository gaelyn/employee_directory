class PositionResource < ApplicationResource
  belongs_to :employee
  filter :employee_id, :integer, readable: false
  attribute :title, :string
  attribute :active, :boolean
  attribute :historical_index, :integer, only: [:sortable]
end
