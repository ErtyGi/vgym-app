<?php

namespace App\Models;

use App\Models\Plan;
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

}