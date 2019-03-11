module GistHelper
  def gist_id(url)
    url.split('/').last
  end

  def gist_link(url)
    link_to gist_id(url), url, target: "_blank"
  end
end
