require 'rails_helper'

RSpec.describe SkillsUser, type: :model do
  let(:skills_user) { SkillsUser.create!( id: 1, user_id: 2, skill_id: 3, details: 'This is a detail' )}
  it "returns valid" do
    expect(skills_user).to be_valid
  end
end
