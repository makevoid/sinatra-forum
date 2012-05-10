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

  def self.find(name)
    icon = all.find{ |icon| icon.name == name }
    icon.path if icon
  end

  def self.all
    return @@all if defined?(@@all)
    @@all = Dir.glob("#{path}/public/images/icons/*.{png,gif,jpg}").map do |icon|
      file = File.basename icon
      name = File.basename icon, ".*"
      Icon.new name: name, file: file
    end
  end

  def self.unpack
    puts `cd public/images/icons; tar xfz icons.tgz`
  end

  def self.avatars
    Dir.glob("#{path}/public/images/avatars/*.{png,gif,jpg}").map do |avatar|
      "/images/avatars/#{File.basename avatar}"
    end
  end

  private

  def self.path
    path = File.expand_path "../../", __FILE__
  end

end