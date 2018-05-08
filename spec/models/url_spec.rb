require 'rails_helper'

describe Url do
  describe 'validates full url' do
    it { is_expected.to allow_value("http://www.example.com").for(:full) }
    it { is_expected.to_not allow_value("not a valid URL").for(:full) }
  end
end
