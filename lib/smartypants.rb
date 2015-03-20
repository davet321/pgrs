if try_require('rubypants', 'rubypants')
    Webby::Filters.register :smartypants do |input|
        RubyPants.new(input).to_html
    end
else
  Webby::Filters.register :smartypants do |input|
    raise Webby::Error, "'rubypants' must be installed to use the smartypants filter"
  end
end
