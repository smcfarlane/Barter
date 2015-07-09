require 'rails_helper'

RSpec.describe Skill, type: :model do
  let(:skill) { Skill.create!( name: 'Plumbing' )}

  it "returns valid" do
    expect(skill).to be_valid
  end

end
