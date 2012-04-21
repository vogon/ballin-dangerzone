require 'rubygame'

class Mixmaster
    def initialize(clips)
        @clips = {}
        clips.each do |sym, path|
            @clips[sym] = Rubygame::Sound.load path
        end
    end

    def update
        if @clips[:cmaj].stopped?
            @clips[:cmaj].play
        end
    end
end