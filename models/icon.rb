class Icon

  attr_reader :name, :file

  def initialize(args={})
    @name = args[:name]
    @file = args[:file]
  end

  def ext
    File.extname @file
  end

  def path
    "/images/icons/#{file}"
  end

  def self.all
    path = File.expand_path "../../", __FILE__
    Dir.glob("#{path}/public/images/icons/*.{png,gif}").map do |icon|
      file = File.basename icon
      name = File.basename icon, ".*"
      Icon.new name: name, file: file
    end
  end

  def self.unpack
    puts `cd public/images/icons; tar xfz icons.tgz`
  end

end