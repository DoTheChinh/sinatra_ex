paths = %w[config/initializers/*.rb app/**/&.rb].map(&:freeze).freeze
paths.each do |path|
  Dir[File.join(MyApp.root, path)].each do |file|
    next if file.include?('initializers/autoloader') # skip me
    require file
  end
end
