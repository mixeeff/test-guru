module GistHelper
  def gist_id(url)
    gist_id_start = url.rindex('/') + 1
    url.slice(gist_id_start..-1)
  end

  def gist_link(url)
    link_to gist_id(url), url, target: "_blank"
    #{}"<a href=\"#{url}\">gist_id(url)</a>"
  end
end
