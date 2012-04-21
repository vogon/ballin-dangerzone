require 'rubygame'
require 'yaml'

class Mixmaster
    private
    class Clip
        def initialize(clip_desc)
            @sound = Rubygame::Sound.load clip_desc[:path]

            @loop_start = clip_desc[:loop_start]
            @loop_end = clip_desc[:loop_end]
        end

        def stopped?
            @sound.stopped?
        end

        def play
            #puts "playing"
            @sound.play
        end

        attr_accessor :sound
        attr_accessor :loop_start, :loop_end
    end

    public
    def initialize(clips_desc)
        @clips = {}
        @clock = Rubygame::Clock.new
        @clock.target_framerate = 256

        clips = YAML::load_file(clips_desc)

        clips.each do |desc|
            @clips[desc[:sym]] = Clip.new desc
        end
    end

    def run
        Thread.new do
            last_loop = Time.now - 1000
            old_clip = @clips[:cmaj]

            loop do
                now = Time.now

                if (now - last_loop) > old_clip.loop_end then
                    new_clip = @clips[@clips.keys.shuffle.pop]
                    new_clip.play
                    
                    last_loop = now
                    old_clip = new_clip
                end

                @clock.tick
            end
        end
    end
end