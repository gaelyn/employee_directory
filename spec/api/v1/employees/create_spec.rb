require 'rails_helper'

RSpec.describe "employees#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/employees", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:employee)
    end
    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(EmployeeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Employee.count }.by(1)
    end
  end

  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: {
            first_name: 'Jane',
            last_name: 'Doe',
            age: 30
          }
        }
      }

      let(:instance) do
        EmployeeResource.build(payload)
      end

      it 'works' do
        expect {
          expect(instance.save).to eq(true)
        }.to change { Employee.count }.by(1)

        employee = Employee.last
        expect(employee.first_name).to eq('Jane')
        expect(employee.last_name).to eq('Doe')
        expect(employee.age).to eq(30)
      end
    end
  end
end
