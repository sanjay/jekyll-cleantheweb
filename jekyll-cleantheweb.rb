module Jekyll

    # Jekyll-CleanTheWeb v0.1.0
    class CleanTheWebTag < Liquid::Tag

        def render(context)
            return "<!-- JEKYLL-CLEANTHEWEB CONFIGURATION MISSING -->" unless context['site'].has_key?('cleantheweb')

            if !context['site']['cleantheweb']['quiet'].nil? && context['site']['cleantheweb']['quiet']
                result = ""
            else
                result = "<!-- Jekyll-CleanTheWeb v0.1.0 by Sanjay Parekh -->\n"
            end

            # If cleantheweb disabled/false globally or for this page, then return immediately.
            return result if (context['site']['cleantheweb']['enable'].nil? || !context['site']['cleantheweb']['enable']) || ((context.has_key?('page') && context['page'].has_key?('cleantheweb') && context['page']['cleantheweb'].has_key?('enable')) && !context['page']['cleantheweb']['enable'])

            # If initial is set on the page, that has priority.  Otherwise grab the global value.  If neither exists, set to an empty string.
            if (context.has_key?('page') && context['page'].has_key?('cleantheweb') && context['page']['cleantheweb'].has_key?('initial'))
                initial = context['page']['cleantheweb']['initial']
            elsif (context.has_key?('site') && context['site'].has_key?('cleantheweb') && context['site']['cleantheweb'].has_key?('initial'))
                initial = context['site']['cleantheweb']['initial']
            else
                initial = ""
            end

            if context.has_key?('page') && context['page']['date'].nil?
                if initial.nil?
                    return result
                else
                    return result + "<meta name=\"ROBOTS\" content=\"" + initial + "\">"
                end
            end

            # If old is set on the page, that has priority.  Otherwise grab the global value.  If neither exists, set to an empty string.
            if (context.has_key?('page') && context['page'].has_key?('cleantheweb') && context['page']['cleantheweb'].has_key?('old'))
                old = context['page']['cleantheweb']['old']
            elsif (context.has_key?('site') && context['site'].has_key?('cleantheweb') && context['site']['cleantheweb'].has_key?('old'))
                old = context['site']['cleantheweb']['old']
            else
                old = ""
            end

            # If days_to_age is set on the page, that has priority.  Otherwise grab the global value.  If neither exists, set to zero.
            if (context.has_key?('page') && context['page'].has_key?('cleantheweb') && context['page']['cleantheweb'].has_key?('days_to_age'))
                days_to_age = context['page']['cleantheweb']['days_to_age'].to_i
            elsif (context.has_key?('site') && context['site'].has_key?('cleantheweb') && context['site']['cleantheweb'].has_key?('days_to_age'))
                days_to_age = context['site']['cleantheweb']['days_to_age'].to_i
            else
                days_to_age = 0
            end

            # If date is set on the page, use that as the date to switch instead of calculating based on the days_to_age variable.
            if (context.has_key?('page') && context['page'].has_key?('cleantheweb') && context['page']['cleantheweb'].has_key?('activate_date'))
                activate_date = Date.parse(context['page']['cleantheweb']['activate_date'].to_s)
            else
                activate_date = Date.parse(context['page']['date'].to_s) + days_to_age
            end

            if Date.today > activate_date
                result += "<meta name=\"ROBOTS\" content=\"" + old + "\">" if !old.nil?
            else
                result += "<meta name=\"ROBOTS\" content=\"" + initial + "\">" if !initial.nil?
            end

            return result

        end

    end
end

Liquid::Template.register_tag('cleantheweb', Jekyll::CleanTheWebTag)
