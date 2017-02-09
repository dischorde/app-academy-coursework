module TracksHelper

  def ugly_lyrics(lyrics)
    uglified = [""]
    lyrics.lines.each { |line| uglified << h(line) }
    "<pre>#{uglified.join('&#9835; ')}</pre>".html_safe
  end
end
