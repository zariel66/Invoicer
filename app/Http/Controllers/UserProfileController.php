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
				'api_token' => '' ,
				"http_status_code" => 401,
				'server_message' => 'No se pudo autenticar el usuario'
			);
		try {
			$credentials = $request->only('username', 'password');
			
			//$credentials = array("username"=>"devuser","password"=> "dev");
			if (Auth::attempt($credentials)) {
				$user = Auth::user();
				$user->api_token = Str::random(60);
				$user->save();
				//$response['api_token'] = Auth::user()->api_token ;
	            $response['api_token'] = Auth::user()->api_token ;
	            $response['http_status_code'] = 200 ;
	            $response['server_message'] = "";
	          
	        }	
		} catch (\Exception $e) {
			return response()->json($response);
		}
		
        return response()->json($response);
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
