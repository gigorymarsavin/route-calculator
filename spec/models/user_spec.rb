require 'rails_helper'

RSpec.describe User, type: :model do
  2.times { |n| create(:package, id: n, user_id: 1) }
  2.times { |n| create(:package, id: n, user_id: 2) }
  let(:org_admin) {create(:org_admin)}
  let(:org_operator) {create(:org_admin)}
  it 'should return only operator`s package' do
    expect ((org_operator.is_admin ? Package.where(organisation_id: org_operator.organisation_id) : org_operator.packages).count).to eq(2)
  end
end
