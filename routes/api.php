<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::group(['middleware'=>['auth:api']],function (){

    Route::get('roles', 'RoleController@index')->name('roles');
    Route::get('search-data/{id}', 'RoleController@search')->name('search');
    Route::post('role-save', 'RoleController@store')->name('role-save');
    Route::post('role-update/{id}', 'RoleController@update')->name('role-update');
    Route::get('role-delete/{id}', 'RoleController@delete')->name('role-delete');
    Route::post('role-delete', 'RoleController@deleteRoles')->name('role-delete-selected');
    Route::get('/verify','ApiUserController@verify' )->name('verify');

});

Route::post('login', 'ApiUserController@login')->name('login');

