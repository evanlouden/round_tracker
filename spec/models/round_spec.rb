# frozen_string_literal

require "rails_helper"

RSpec.describe Round do
  describe "validations" do
    it { should belong_to(:user) }
    it { should belong_to(:course) }
  end
end
