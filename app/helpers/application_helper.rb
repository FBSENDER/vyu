module ApplicationHelper
  def title(page_title = "羽毛球比赛规则")
    content_for :title, page_title.to_s
  end
  def keywords(page_keywords = "羽毛球比赛规则,羽毛球规则")
    content_for :keywords, page_keywords.to_s
  end
  def head_desc(page_description = "")
    content_for :head_desc, page_description.to_s
  end
  def mobile_url(path)
    content_for :mobile_url, "#{path}"
  end
  def path(path)
    content_for :path, path
  end
  def disable_turbolinks?(disable = false)
    content_for :disable_turbolinks, disable ? 'data-no-turbolink' : ''
  end

  def is_turbolinks_cache?(cache = true)
    content_for :turbolinks_cache, cache ? 'cache' : 'no-cache'
  end
end
