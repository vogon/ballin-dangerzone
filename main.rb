require 'rubygame'

class Game
	def initialize
		@screen = Rubygame::Screen.new [640,480], 0, [Rubygame::HWSURFACE, Rubygame::DOUBLEBUF]
		@screen.title = "project ballin' dangerzone"
 
		@queue = Rubygame::EventQueue.new
		@clock = Rubygame::Clock.new
		@clock.target_framerate = 60
	end
 
	def run
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
game.run