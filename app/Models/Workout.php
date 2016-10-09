<?php

namespace App\Models;

use App\Models\Plan;
use App\Models\Exercise;
use Illuminate\Database\Eloquent\Model;


/**
* Workout
*/
class Workout extends Model
{
	
	protected $table = 'plan_days';
	protected $fillable	= [
		'day_name',
		
		];

	public function plan()
	{
		return $this->belongsTo(Plan::class);
	}


		public function exercises()
	{
		return $this->belongsToMany(Exercise::class, 'day_id');
	}

}