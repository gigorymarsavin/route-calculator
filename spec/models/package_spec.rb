require 'rails_helper'

RSpec.describe Package, type: :model do
  describe 'package model' do
    it 'should create package' do
      package_one = Package.create(name: 'Ivan', surname: 'Illarionov', midname: 'Romanovich', phone: 897717, email: 'ivan@mail.ru', weight: 30, length: 10, width: 15, height: 90, addr_to: 'Moscow', addr_from: 'Berlin')
      expect(package_one).to be_valid
    end
  end
end
