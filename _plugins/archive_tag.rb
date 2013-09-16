module Jekyll
  class ArchiveTag < Liquid::Tag
    safe = true
    
    def render(context)
      result = "<h2>Archives by Month</h2>"
      all_posts = context.registers[:site].posts
      result << "<ul>"
      collate_by_month(all_posts).each do |key,posts|
        result << %(<li><a href="/archive/#{key}/index.html"><strong>#{key} (#{posts.length} posts)</strong></a></li>)
      end
      result << "</ul>"
      result
    end
    private
    def collate_by_month(posts)
      collated = {}
      posts.each do |post|
          key = "#{post.date.year}/#{post.date.month}"
          if collated.has_key? key
            collated[key] << post
          else
            collated[key] = [post]
          end
      end
      collated
    end  
    
  end
end
 
Liquid::Template.register_tag('archive_list', Jekyll::ArchiveTag)