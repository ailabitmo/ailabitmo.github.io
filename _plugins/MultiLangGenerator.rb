module Jekyll

  class MultiLangPage < Page
    def initialize(site, base, dir, name, locale)
      @site = site
      @base = base
      if dir == 'home'
        @dir = locale
      else
        @dir = File.join(locale, dir)
      end
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "#{name}.html")
      self.data['locale'] = locale
    end
  end

  class MultiLangGenerator < Generator
    safe true

    def generate(site)
      site.layouts.select {|l| l.start_with? 'ml_'}.each do |layout|
        dir_name = layout[0][3..layout[0].length]
        site.pages << MultiLangPage.new(site, site.source, dir_name, layout[0], 'ru')
        site.pages << MultiLangPage.new(site, site.source, dir_name, layout[0], 'en')
      end
    end
  end
end