module UrisHelper
  def link(uri, style = nil)
    if(style == 'secure')
      protocol = 'https://'
      host = 'dnk2vbhoq39rr.cloudfront.net/'
    else
      host = 'cdn.freewaypro.com/'
      protocol = 'http://'
    end
    link = "#{protocol}#{host}#{uri.file_uid}";
    if uri.make_link?
      link_to(link, link)
    else
      link
    end
  end
end