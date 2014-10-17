youtube = Popcorn.HTMLYouTubeVideoElement("#video")

video = $.url().param('v')

unless video?
	video = 'https://www.youtube.com/watch?v=hS4mlDNb6Yg'

youtube.src = video
pop = new Popcorn(youtube)

times = $.url().param('t')
unless times?
	times = [6]

screamAt = (t) ->
	pop.code
		start: Popcorn.util.toSeconds(t)
		end: Popcorn.util.toSeconds(t) + 1
		onStart: (options) ->
			$("#wilhelm")[0].play()
			return

screamAt time for time in times

pop.play()