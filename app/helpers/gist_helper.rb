module GistHelper
  def gist_link(id)
    "<a href=\"https://gist.github.com/#{id}\" target=\"_blank\">#{id}</a>"
  end
end
