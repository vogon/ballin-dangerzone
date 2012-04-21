# main game loop coldly stolen from http://rubygame.org/wiki/Generic_Game_Template

require 'rubygame'
require './mixmaster.rb'

class Game
    def initialize
        @screen = Rubygame::Screen.new [640,480], 0, [Rubygame::HWSURFACE, Rubygame::DOUBLEBUF]
        @screen.title = "project ballin' dangerzone"
 
        @queue = Rubygame::EventQueue.new
        @clock = Rubygame::Clock.new
        @clock.target_framerate = 60

        @mixmaster = Mixmaster.new "./trax1.yml"
    end
 
    def run
        @mixmaster.run

        loop do
            update
            draw
            @clock.tick
        end
    end
 
    def update
        @queue.each do |ev|
            case ev
                when Rubygame::QuitEvent
                    Rubygame.quit
                    exit
            end
        end
    end
 
    def draw
        @screen.flip
    end
end
 
game = Game.new
Rubygame.open_audio( {:frequency => 44100, :channels => 2} )

game.run

Rubygame.close_audio