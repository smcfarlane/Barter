require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { Skill.create!( name: 'Plumbing' )}
  before :each do
    # @user = create(:user)
    # @skill = create(:skill)
  end

  it "returns valid" do
    expect(skill).to be_valid
  end

end
