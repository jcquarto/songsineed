# call this via rake

namespace :songs do
  desc "migrate songs"
  task :migrate => :environment do
    require = Rails.root.join( 'app/models/song' )

    require 'rubygems'
    require 'hpricot'
    require 'open-uri'

    doc = open("http://www.johnquarto.com/stuff/songs-i-need.html", 'User-Agent'=>'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2') { |f| Hpricot(f) }
    puts doc.search('h1')

    x = 0
    doc.search('tr').each do |tr|
      tds = tr.search('td')
      if tds.any?
        title = tds[0].inner_text.squeeze(" ").strip
        artist = tds[1].inner_text.squeeze(" ").strip
        album = tds[2].inner_text.squeeze(" ").strip
        #puts tds
        puts 'title: ' + title
        puts 'artist: ' + artist
        puts 'album: ' + album

        s = Song.new
        s.title = title
        s.artist = artist
        s.album = album
        if s.save
          puts "wow, it worked\n"
        end
        
      end
    end



  end
  
end