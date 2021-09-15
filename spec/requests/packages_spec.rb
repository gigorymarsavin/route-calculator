require 'rails_helper'
require 'pry'

RSpec.describe "/packages", type: :request do

  let!(:package_x) { create(:package, user_id: 2) }
  let!(:package_y) { create(:package, user_id: 2, id: 2) }
  let!(:package_n) { create(:package, user_id: 2, id: 3) }
  let!(:package_d) { create(:package, user_id: 2, id: 4) }
  let!(:package_z) { create(:package, user_id: 2, id: 5) }
  params = {}

  let!(:user) {create(:user, id: 2)}

  it 'sorting by price via query' do
    params[:sort] = 'price'
    packages = Packages::GridQuery.call(params.merge(current_user: user))
    expect(packages.first.price > packages.last.price).to be true
  end

  it 'sorting by price via query' do
    params[:sort] = 'price'
    packages = Packages::GridQuery.call(params.merge(current_user: user))
    expect(packages.first.price > packages.last.price).to be true
  end

  it 'sorting by distance via query' do
    params[:sort] = 'distance'
    packages = Packages::GridQuery.call(params.merge(current_user: user))
    expect(packages.first.distance > packages.last.distance).to be true
  end

  it 'paginate via query' do
    params[:page] = 1
    params[:per_page] = 3
    packages = Packages::GridQuery.call(params.merge(current_user: user))
    expect(packages.count).to eq(3)
  end

end