<?php
session_start();

require __DIR__. '/../vendor/autoload.php';

$app = new \Slim\App([
	'settings' => [
		'displayErrorDetails' => true,
		'db' => [
			'driver'    => 'mysql',
		    'host'      => 'us-cdbr-iron-east-04.cleardb.net',
		    'database'  => 'heroku_42a2cc393e4d67c',
		   /* 'username'  => 'homestead', */
		    'username'  => 'b65fcd3b6efbb4',
		    
		   /* 'password'  => 'secret', */
		   'password'  => '84d86978',

		    'charset'   => 'utf8',
		    'collation' => 'utf8_unicode_ci',
		    'prefix'    => '',
		]		 
	],
	
]);



$container = $app->getContainer();

$capsule = new \Illuminate\Database\Capsule\Manager;
$capsule->addConnection($container['settings']['db']);
$capsule->setAsGlobal();
$capsule->bootEloquent();

$container['db'] = function ($container)  use ($capsule) {
	return $capsule;
};

$container['view'] = function ($container) {
	$view = new \Slim\Views\Twig( __DIR__ . '/../resources/views', [
		'cache' => false,
		 /* change in true for production */
	]);

	$view->addExtension( new \Slim\Views\TwigExtension(
			$container->router,
			$container->request->getUri()
		));
	return $view;
};

$container['PlanController'] = function ($container){
	return new \App\Controllers\PlanController($container);
};

require __DIR__.'/../app/routes.php';