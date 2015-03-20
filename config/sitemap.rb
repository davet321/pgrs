# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.pgrs.org.uk"
SitemapGenerator::Sitemap.public_path = 'output'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  def add_file (name, opts)
      opts[:lastmod] = File.ctime(name)
      add name, opts
  end

  Dir.chdir('output') do
      add_file 'about.html', :priority => 0.2, :changefreq => 'monthly'
      add_file 'contact.html', :priority => 0.8, :changefreq => 'monthly'
      add_file 'events.html', :priority => 0.8, :changefreq => 'daily'
      add_file 'glasgow.html', :priority => 0.4, :changefreq => 'monthly'
      add_file 'phd.html', :priority => 0.6, :changefreq => 'monthly'
      Dir.glob(File.join('events', '*.html')) do |event|
          add_file event, :priority => 0.2, :changefreq => 'never'
      end
  end
end
