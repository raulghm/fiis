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

	if $(window).scrollTop() > 600
		$('header.second').addClass 'toggle'
	else
		$('header.second').removeClass 'toggle'


$('document').ready ->

	setTimeout ->
		$("html").addClass "init"
	, 10

	setTimeout ->
		$("html").addClass "init-1"
	, 200

	setTimeout ->
		$("html").addClass "init-2"
	, 700

	$('nav a.menu').click (e) ->
		e.preventDefault()
		animatingScroll = true
		$('nav a').removeClass "active"
		$(this).addClass "active"
		$("html, body").animate
			scrollTop: $("[name=\"" + $.attr(this, "href").substr(1) + "\"]").offset().top
		, 600, ->
			animatingScroll = false 

	feed = new Instafeed
		clientId: "fd88310566744275a3d68092d9c175d1"
		get: "tagged"
		tagName: "gapchile"
		target: "instafeed-0"
		resolution: "low_resolution"
		template: '<div class="item"><a target="_blank" class="item-inner" href="{{link}}" style="background-image:url({{image}});"><div class="footer"><i class="icon fo-instagram"></i> <span class="caption">{{caption}}</span></div></a></div>'

	feed1 = new Instafeed
		clientId: "fd88310566744275a3d68092d9c175d1"
		get: "tagged"
		tagName: "diseñatupolera"
		target: "instafeed-1"
		resolution: "low_resolution"
		template: '<div class="item"><a target="_blank" class="item-inner" href="{{link}}" style="background-image:url({{image}});"><div class="footer"><i class="icon fo-instagram"></i> <span class="caption">{{caption}}</span></div></a></div>'

	feed.run()
	feed1.run()

	$('.loading').click ->
		feed.next()
		feed1.next()

