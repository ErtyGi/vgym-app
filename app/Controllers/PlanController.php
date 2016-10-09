<?php

namespace App\Controllers;

use App\Models\Plan;
use App\Models\Workout;
use App\Models\Exercise;
use Slim\Views\Twig as View;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


class PlanController extends Controller
{	
	public function index( $request,  $response)
	{		
		$plans = Plan::with('workouts')->get();	
		
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

	public function delete($request,  $response, $id)
	{
		$plan = Plan::destroy($id);	
		
		return $response->withRedirect($this->router->pathFor('home'));	


	}

	public function getPlan(Request $request, Response $response, $id)
	{
		
		$plan = Plan::with('workouts')->find($id)->first();

	
		echo  json_encode([ 'plan'=>$plan ]);

		
	}
      





}