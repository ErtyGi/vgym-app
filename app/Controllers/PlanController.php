<?php

namespace App\Controllers;

use App\Models\Plan;
use App\Models\Workout;
use Slim\Views\Twig as View;



class PlanController extends Controller
{	
	public function index( $request,  $response)
	{		
		$plans = Plan::get();	

		return $this->view->render($response, 'home.twig',[

				'plans' => $plans,

			]);
	}

	public  function add($request,  $response)
	{
		
		$plan = Plan::create([
			'plan_name' => $request->getParam('formPlanName') ,
			'plan_description' => $request->getParam('formPlanDesc') ,

			]);

	/*	$update = Plan::where('id',2)->update([
			'plan_description' => 'this is updated',
			]); */

		return $response->withRedirect($this->router->pathFor('home'));
	}

	public function getPlan($request,  $response, $id)
	{
		$plan = Plan::where('id',$id)->get()->first();
		echo  json_encode($plan);
		
	}
      



	public function workouts()
	{
		return $this->hasMany(Workout::class);
	}


}