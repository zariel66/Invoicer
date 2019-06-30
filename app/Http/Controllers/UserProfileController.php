<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Str;
use Illuminate\Support\Facades\Auth;
class UserProfileController extends Controller
{
    public function createUser()
	{
		/*$id = DB::table('paws_user')->insert(
			[
				'email' => 'john@example.com',
				'profile' => 1,
				'username' => 'mafer',
				'password' => bcrypt('my-secret-password')
			]
		);
		return "Mafer: " . $id;*/
		$user = new User;

		$user->username = "devuser";
		$user->password = bcrypt('dev');
		$user->profile = 1;
		$user->email = 'mafer@example.com';
		$user->api_token =  Str::random(60);
		$user->save();
		return $user->id_user;
	}

	public function login(Request $request)
	{
		$response = array(
				'body' => array() ,
				'server_message' => 'Usuario/Contraseña inválidos'
			);
		try {
			$credentials = $request->only('username', 'password');
			
			//$credentials = array("username"=>"devuser","password"=> "dev");
			if (Auth::attempt($credentials)) {
				$user = Auth::user();
				$user->api_token = Str::random(60);
				$user->save();
				//$response['api_token'] = Auth::user()->api_token ;
	            $response['body']['api_token'] = Auth::user()->api_token ;
	            $response['server_message'] = "Bienvenido " . $user->username;
	          
	        }
	        else 
	        {
	        	throw new \Exception("Error Login", 1);
	        	//return response()->json($response,$status = 404);
	        }	
		} catch (\Exception $e) {
			return response()->json($response,$status = 401);

		}
		
        return response()->json($response,$status = 200);
	}

	public function username()
	{
		return 'username';
	}

	/*protected function guard()
	{
		return Auth::guard('api');
	}*/
}
