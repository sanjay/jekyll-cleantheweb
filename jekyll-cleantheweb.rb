module Jekyll

    class CleanTheWebTag < Liquid::Tag

        def initialize(tag_name, text, tokens)
            return
        end

        def render(context)
            return "" unless context['site']['cleantheweb']['enable']
            return "<meta name=\"ROBOTS\" content=\"" + context['site']['cleantheweb']['new_pages'] + "\">" if context['page']['date'].nil?

            activate_date = Date.parse(context['page']['date'].to_s) + context['site']['cleantheweb']['days_to_age']
            if Date.today > activate_date
                return "<meta name=\"ROBOTS\" content=\"" + context['site']['cleantheweb']['old_pages'] + "\">"
            else
                return "<meta name=\"ROBOTS\" content=\"" + context['site']['cleantheweb']['new_pages'] + "\">"
            end

        end

    end
end

Liquid::Template.register_tag('cleantheweb', Jekyll::CleanTheWebTag)
