module PolaroidHelper
    def polaroid(image, caption, title='', clazz='')
        return "<figure class=\"fix-rhythm #{clazz}\">![](/images/pictures/#{image} \"#{title}\")<figcaption>#{caption}</figcaption></figure>"
    end
end

Webby::Helpers.register(PolaroidHelper)
