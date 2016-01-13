$(document).ready(function() {
	$('#form').transition('toggle');
	$('#topPage').transition('toggle');

    	$('#fullpage').fullpage({
    		anchors: ['about', 'home'],

    		afterLoad: function(anchorLink, index){
      		var loadedSection = $(this);

	      	//using anchorLink
			if(anchorLink == 'home'){
		      	$('#form').transition('fade down');
			}else if(anchorLink == 'about'){
				$('#topPage').transition('fade up');
			}
		},

		onLeave: function(index, nextIndex, direction){
	            var leavingSection = $(this);

	            //after leaving section 2
	            if(index == 2 && direction =='up'){
	                $('#form').transition('fade up');
	            }else if(index == 1 && direction == 'down'){
	            	$('#topPage').transition('fade down');
	            }
       	 }
    	});
   	
    $('.shape').shape();
});

function flipOver() {
	$('.shape').shape('flip over');
	if($('#signup-login').prop('textContent') == 'Sign up'){
		$('#signup-login').prop('textContent', 'Login');
	}else{
		$('#signup-login').prop('textContent', 'Sign up');
	}
}