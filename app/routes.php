<?php

$app->get('/', 'PlanController:index')-> setName('home');

$app->post('/plan/add', 'PlanController:add')-> setName('addPlan');
$app->get('/plan/delete/{id}', 'PlanController:delete')-> setName('deletePlan');

$app->get('/plan/{id}', 'PlanController:getPlan')->setName('getPlan');


$app->get('/plan/update/{id}', 'PlanController:update')->setName('updatePlan');

