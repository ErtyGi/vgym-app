
  $("#addRowPlan").click(function()
  {    
    $("#showRowPlan").removeClass('hidden');
    $("#addRowPlan").hide();
    return false;
  });



$('#listPlans > .list-group-item').on('click', function() {
    var $this = $(this);
    var $id = $this.attr('id');

    $('.active').removeClass('active');
    $this.toggleClass('active')

  
    getPlan($id);
});


function getPlan(id) {
	$('#output').html('Loading...');
	jQuery.ajax({
		url: '/plan/'+id ,
		data:'id='+id,
		type: "GET",
		success:function(data){
			
			$('#output').html(data);
			
			
		}
	});
}


  