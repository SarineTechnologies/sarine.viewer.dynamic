###!
sarine.viewer.dynamic - v0.2.0 -  Thursday, July 9th, 2015, 1:13:29 PM 
 The source code, name, and look and feel of the software are Copyright © 2015 Sarine Technologies Ltd. All Rights Reserved. You may not duplicate, copy, reuse, sell or otherwise exploit any portion of the code, content or visual design elements without express written permission from Sarine Technologies Ltd. The terms and conditions of the sarine.com website (http://sarine.com/terms-and-conditions/) apply to the access and use of this software.
###
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
			@setTimeout(@delay,_t.play)   
	stop: ()-> 
		@playing = false


 