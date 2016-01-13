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
});

function flipOver() {
	$('.shape').shape('flip over');
}