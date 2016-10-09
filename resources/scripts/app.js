
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
		url: '/plan/'+ id ,
		data:'id='+ id,
		type: "GET",
		contentType: 'application/json; charset=utf-8',
		dataType: "json",
		success:function(data){
		
		$('#test').html(data);


		$("#outputNamePlan").each(function() {
			 $(this).html(data.plan['plan_name'])
		});				
		
		var list='';
		$.each(data.plan.workouts, function(i, lineItem) {
         list += '<li class="list-group-item">'+lineItem['day_name']+'</li>';
      	});
		$('#listWorkouts li').remove();
		$('#listWorkouts').append(list);


		$("#outputDesc").html(data.plan['plan_description']);
		$("#deletePlan").attr('data-value',data.plan['id']);

        	
			
		}
	});
}


$('#deletePlan').on('click', function() {
    var $this = $(this);
    var $id = $this.attr('data-value');
  
    deletePlan($id);
});


function deletePlan(idPlan){	



	 var ask = window.confirm("Are you sure you want to delete this Plan?");
    if (ask) {

       window.alert("Successfully deleted.");

        document.location.href = '/plan/delete/'+ idPlan ;

    }

}
  