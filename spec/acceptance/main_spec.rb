require_relative "spec_helper"

describe "Sinforum" do
  it "GET /" do
    get "/"
    body.should =~ /BIT/
  end
end