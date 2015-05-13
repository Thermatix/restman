#BUID asset definition DSL
Restman::Assets.paths = [
	{
		to: '/js', 		 	  	  
		from:  "assets/js"
	},
	{
		to: '/materialize',  	  
		from:  "assets/js/materialize"
	},
	{
		to: '/css', 		 	  
		from:  "assets/css"
	},
	{
		to: '/image',	 	  	  
		from:  "assets/images"
	},
	{
		to: '/font',		 	  
		from:  "assets/fonts"
	}
]


Restman::Assets.list = [
	{
		type: :js,
		name: :jquery,
		paths: %w(/js/jQuery-v2.1.4.js)
	},
	{
		type: :js,
		name: :client,
		paths: %w(/js/client.js)
	},
	{
		type: :js,
		name: :materialize,
		paths: %w(/materialize/*.js /materialize/**/*.js)
	},
	{
		type: :css,
		name: :client,
		paths: %w(/css/client.css)
	},
	{
		type: :css,
		name: :materialize,
		paths: %w(/css/materialize.css)
	}

]
