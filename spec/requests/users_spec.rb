require 'rails_helper'


RSpec.describe "/users", type: :request do

  let!(:admin_x) {create(:user, id: 1, is_admin: true )}
  let!(:oper_x) {create(:user, id: 2)}
  let!(:oper_y) {create(:user, id: 3, organisation_id: 2)}

  it 'admin gets operator only from his organisation' do
    operators = Operators::GridQuery.call(params.merge(current_user: admin_x))
    expect(operators).not_to include(oper_y).and include(oper_x)
  end

end