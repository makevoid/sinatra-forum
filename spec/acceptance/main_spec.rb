require_relative "spec_helper"

describe "Sinforum" do
  it "GET /" do
    get "/"
    body.should =~ /Sinforum/
  end
end