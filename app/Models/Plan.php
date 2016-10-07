<?php
namespace App\Models;

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

	
}