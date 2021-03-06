require 'spec_helper'
require_dependency 'post'
require_dependency 'user'

describe BasicPostSerializer do

  context "name" do
    let(:user) { Fabricate.build(:user) }
    let(:post) { Fabricate.build(:post, user: user) }
    let(:serializer) { BasicPostSerializer.new(post, scope: Guardian.new, root: false) }
    let(:json) { serializer.as_json }

    it "returns the name it when `enable_names` is true" do
      SiteSetting.stubs(:enable_names?).returns(true)
      json[:name].should be_present
    end

    it "doesn't return the name it when `enable_names` is false" do
      SiteSetting.stubs(:enable_names?).returns(false)
      json[:name].should be_blank
    end

  end

end
