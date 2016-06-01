require 'rails_helper'

describe AdditionalActivity, type: :model do
  describe 'validation' do
    before :each do
      @additional_activity = AdditionalActivity.new(activity:"Mais Educação")
    end

    it 'should require a activity' do
      @additional_activity.activity = nil
      expect(@additional_activity).to_not be_valid
    end
  end
end
