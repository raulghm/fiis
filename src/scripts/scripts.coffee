animatingScroll = false

$(window).scroll ->
	if $(window).scrollTop() + $(window).height() >= $(document).height() - 150
		$('.loading').addClass 'toggle'

		setTimeout(->
			$('.loading').removeClass 'toggle'

			setTimeout(->
				$('.loading').click()
			, 500)
		, 1000)

	if $(window).scrollTop() > 640
		$('header.second').addClass 'toggle'
	else
		$('header.second').removeClass 'toggle'


$('document').ready ->

	$('nav a.menu').click (e) ->
		e.preventDefault()
		animatingScroll = true
		$('nav a').removeClass "active"
		$(this).addClass "active"
		$("html, body").animate
			scrollTop: $("[name=\"" + $.attr(this, "href").substr(1) + "\"]").offset().top
		, 600, ->
			animatingScroll = false

	# getMultipleTags = (tags) ->
	#   feeds = []
	#   i = 0
	#   len = tags.length

	#   while i < len
	#     feeds.push new Instafeed(
	#       clientId: "fd88310566744275a3d68092d9c175d1"
	#       # rest of your options
	#       get: "tagged"
	#       tagName: tags[i]
	#       target: "feed-" + tags[i]
	#     )
	#     i++
	#   feeds

	# # get multiple tags
	# myTags = getMultipleTags([
	#   "glass"
	#   "wood"
	# ])

	# # run each instance
	# i = 0
	# len = myTags.length

	# setTimeout( ->
	# 	while i < len
	#   	myTags[i].run()
	#   	i++
	# , 1000)

	feed = new Instafeed
		clientId: "fd88310566744275a3d68092d9c175d1"
		get: "tagged"
		tagName: "gap"
		target: "instafeed-0"
		resolution: "low_resolution"
		template: '<div class="item"><a target="_blank" class="item-inner" href="{{link}}" style="background-image:url({{image}});"><div class="footer"><i class="icon fo-instagram"></i> <span class="caption">{{caption}}</span></div></a></div>'

	feed.run()

	$('.loading').click ->
		feed.next()

	# feed1 = new Instafeed(
	#   clientId: "fd88310566744275a3d68092d9c175d1"
	#   get: "tagged"
	#   tagName: "banana"
	#   target: "instafeed-2"
	# )

	# feed1.run()

	# $("#instafeed-0").infinitescroll
	#   loading:
	#     finished: `undefined`
	#     finishedMsg: "<em>Congratulations, you've reached the end of the internet.</em>"
	#     img: null
	#     msg: null
	#     msgText: "<em>Loading the next set of posts...</em>"
	#     selector: null
	#     speed: "fast"
	#     start: `undefined`

	#   state:
	#     isDuringAjax: false
	#     isInvalidPage: false
	#     isDestroyed: false
	#     isDone: false # For when it goes all the way through the archive.
	#     isPaused: false
	#     currPage: 1

	#   behavior: `undefined`
	#   binder: $(window) # used to cache the selector for the element that will be scrolling
	#   nextSelector: "div.navigation a:first"
	#   navSelector: "div.navigation"
	#   contentSelector: null # rename to pageFragment
	#   extraScrollPx: 150
	#   itemSelector: "div.post"
	#   animate: false
	#   pathParse: `undefined`
	#   dataType: "html"
	#   appendCallback: true
	#   bufferPx: 40
	#   errorCallback: ->

	#   infid: 0 #Instance ID
	#   pixelsFromNavToBottom: `undefined`
	#   path: `undefined` # Can either be an array of URL parts (e.g. ["/page/", "/"]) or a function that accepts the page number and returns a URL
	#   maxPage: `undefined` # to manually control maximum page (when maxPage is undefined, maximum page limitation is not work)
