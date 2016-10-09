<?php

namespace App\Models;

use App\Models\Workout;
use Illuminate\Database\Eloquent\Model;


/**
* Exercise
*/
class Exercise extends Model
{
	
	protected $table = 'exercise';
	protected $fillable	= [
		'exercise_duration',
		
		];


	public function workouts()
	{
		return $this->belongsToMany(Workout::class)
	}

}