$(document).ready(function() {
	$('#bottomPage .bottomPagePart').transition('toggle');
	$('#topPage').transition('toggle');
	$("#UPrint").transition('toggle');

    	$('#fullpage').fullpage({
    		anchors: ['about', 'home'],
    		navigation: true,
    		navigationPosition: 'left',

    		afterLoad: function(anchorLink, index){
      		var loadedSection = $(this);

	      	//using anchorLink
			if(anchorLink == 'home'){
				$('#UPrint').transition('fade down');
		      	$('#bottomPage .bottomPagePart').transition({
		      		animation: 'fade down',
		      		duration: 800,
		      		interval: 600
		      	});
			}else if(anchorLink == 'about'){
				$('#topPage').transition('fade up');
			}
		},

		onLeave: function(index, nextIndex, direction){
	            var leavingSection = $(this);

	            //after leaving section 2
	            if(index == 2 && direction =='up'){
	                $('#bottomPage .bottomPagePart').transition('fade up');
	                $('#UPrint').transition('fade up');
	            }else if(index == 1 && direction == 'down'){
	            	$('#topPage').transition('fade down');
	            }
       	 }
    	});
});

function flipOver() {
	$('.shape').shape('flip over');
}