<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function index(Request $request)
    {
        
        $per_page = $request->per_page ? $request->per_page : 5;
         return response()->json(['queryData'=> Role::paginate($per_page)],200);
       //dd(Role::paginate($per_page));
    }

    public function search($id)
    {
        $roles= Role::where('name','LIKE',"%$id%")->paginate();
        return response()->json(['queryData' => $roles], 200);
    }
    public function store(Request $request)
    {

        $role= Role::create([
           'name'=>$request->name,
       ]);
        return response()->json(['role' => $role], 200);
    }

    public function update(Request $request, $id)
    {
        $role= Role::find($id);
        $role->name= $request->name;
        $role->save();
        return response()->json(['role' => $role], 200);
    }

    public function delete($id)
    {
        $role= Role::find($id)->delete();
        return response()->json(['role' => $role], 200);
    }

    public function deleteRoles(Request $request)
    {
        Role::whereIn('id',$request->roles)->delete();
        return response()->json(['msg' => 'record deleted successfully'], 200);
    }
}

