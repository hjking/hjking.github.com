module Jekyll

  class ArchivePage < Page
    def initialize(site, base, dir, archive, posts)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive_index.html')

      archive_title_prefix = site.config['category_title_prefix'] || 'Archive: '
      self.data['title'] = "#{archive_title_prefix}#{archive}"
      self.data['posts'] = posts
    end
  end

  class ArchivePageGenerator < Generator
    safe true
    
    def generate(site)
      if site.layouts.key? 'archive_index'
        dir = site.config['archive_dir'] || 'archive'
        collate_by_month(site.posts).each do |month,posts|
          site.pages << ArchivePage.new(site, site.source, File.join(dir, month), month, posts)
        end
      end
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