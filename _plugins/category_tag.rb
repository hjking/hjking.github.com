module Jekyll
  class CategoryTag < Liquid::Tag
    safe = true
    
    def render(context)
      result = "<h2>Categories</h2>"
      categories = context.registers[:site].categories
      result << "<ul>"
      categories.keys.each do |category|
        result << %(<li><a href="/category/#{category}/index.html"><strong>#{category} (#{categories[category].length})</strong></a></li>)
      end
      result << "</ul>"
      result
    end
  end
end
 
Liquid::Template.register_tag('category_list', Jekyll::CategoryTag)