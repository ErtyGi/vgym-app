<?php
namespace App\Models;

use App\Models\Workout;
use Illuminate\Database\Eloquent\Model;

/**
* 
*/
class Plan extends Model
{
	
	protected $table 	= 'plan';
	protected $fillable	= [
		'plan_name',
		'plan_description',
		'plan_difficulty'
		];

	public function workouts()
	{
		return $this->hasMany(Workout::class, 'plan_id');
	}



	
}