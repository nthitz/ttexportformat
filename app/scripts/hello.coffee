init = () ->
	d3.select('.go').on('click', doIt)
doIt = () ->
	input = $('.input').val()
	songsByArtists = {}
	data = d3.csv.parse(input)
	console.log data
	console.log('test')
	_.each(data, (datum) ->
		artist = datum.artist
		title = datum.song

		disp = 
		if typeof songsByArtists[artist] is 'undefined'
			songsByArtists[artist] = {artist: artist, songs: []}
		songsByArtists[artist]['songs'].push(datum)
	)
	artists = []
	_.each(songsByArtists, (artist) ->
		artist.songs.sort((a,b) ->
			if a.song > b.song
				return 1
			else if a.song < b.song
				return -1
			else
				return 0
		)
		artists.push(artist)
	)
	artists.sort((a,b) ->
		if a.artist > b.artist
			return 1
		else if a.artist < b.artist
			return -1
		else
			return 0

	)
	console.log artists
	text = ''
	_.each(artists, (artist) ->
		_.each(artist.songs, (song) ->
			text += song.artist + ' - ' + song.song + ' - ' + song.album + '<br />'
		)
	)
	console.log text
	$('.out').html(text)

	

out = (str) ->
  $('.output').append(str)

$(document).ready(init)