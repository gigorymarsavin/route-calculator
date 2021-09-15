require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:org_admin) {create(:user, is_admin: true)}
  let(:org_operator) {create(:user, id: 2)}

  let!(:package_x) { create(:package) }
  let!(:package_y) { create(:package, id: 2) }
  
  it 'should return only operator`s package' do
    2.times { |n| create(:package, id: n, user_id: 1) }
    2.times { |n| create(:package, id: n + 3, user_id: 2) }
    packages = org_operator.is_admin ? Package.where(organisation_id: org_operator.organisation_id) : org_operator.packages
    expect(packages.count).to eq(2)
  end

  it 'should return only operator`s package' do
    2.times { |n| create(:package, id: n, user_id: 1) }
    2.times { |n| create(:package, id: n + 3, user_id: 2) }
    packages = org_operator.is_admin ? Package.where(organisation_id: org_operator.organisation_id) : org_operator.packages
    expect(packages.count).to eq(2)
  end
end