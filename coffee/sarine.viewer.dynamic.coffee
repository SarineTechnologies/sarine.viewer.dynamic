class Viewer.Dynamic extends Viewer
	@playing = false
	nextImage : Error

	constructor: (options) ->
		super(options)
		@delay = 50
		Object.getOwnPropertyNames(Viewer.Dynamic.prototype).forEach((k)-> 
			if @[k].name == "Error" 
				console.error @id, k, "Must be implement" , @
		,
			@)
	play: (force,delay) ->
		if force
			@playing = true;
		@nextImage.apply(@)
		if(@playing)
			_t = @
			@setTimeout(@delay).then(_t.play)
	stop: ()->
		@playing = false


