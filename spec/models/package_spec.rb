require 'rails_helper'

RSpec.describe Package, type: :model do
  let!(:operator_x) { create(:user) }
  let!(:operator_y) { create(:user, id: 2) }

  let!(:package_x) { create(:package) }
  let!(:package_y) { create(:package, user_id: 2) }

  let!(:api_service) {create(:api, name: 'noapi')}
  
  it 'operator gets only his own packages' do
    packages_x = Package.where(id: operator_x.id)
    expect(packages_x).not_to include(Package.find_by(user_id: operator_y.id))
  end

  it 'package_sent aasm_state should work ' do 
    package_x.package_sent! 
    expect(package_x.aasm_state).to eq('sent')
  end

  it 'package_delivered aasm_state should work ' do 
    package_x.package_delivered! 
    expect(package_x.aasm_state).to eq('delivered')
  end
  
  it 'proxy should not works when api name incorrect' do    
    package_params = package_x.attributes
    expect { RouteCalculator.call(package_params.merge(service: api_service.name)) }.to raise_error(NameError)
  end
end