xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", 'xmlns:atom' => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "JM Coaching Blog"
    xml.description "Blog for JM Coaching Services"
    xml.link posts_url
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => posts_url

    @all_posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.summary
        xml.pubDate post.updated_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end