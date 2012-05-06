class Icon

  attr_reader :name, :path

  def initialize(args={})
    @name = args[:name]
    @path = args[:path]
  end

  def self.all
    path = File.expand_path "../../", __FILE__
    Dir.glob("#{path}/public/images/icons/*").map do |icon|
      name = File.basename icon
      Icon.new name: name, path: name
    end
  end
end