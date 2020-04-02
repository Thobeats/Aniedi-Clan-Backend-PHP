<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\ValidationException;
use App\Mail\WelcomeMail;

class RegisterController extends Controller
{

    public function admin(Request $request) {
        $msg = $this->create($request, $role='0');

        return response()->json($msg, $msg['status']);
    }

    public function doctor(Request $request) {
        $msg = $this->create($request, $role='1');

        return response()->json($msg, $msg['status']);
    }

    public function nurse(Request $request) {
        $msg = $this->create($request, $role='2');

        return response()->json($msg, $msg['status']);
    }

    public function receptionist(Request $request) {
        $msg = $this->create($request, $role='3');

        return response()->json($msg, $msg['status']);
    }

    public function pharmacist(Request $request) {
        $msg = $this->create($request, $role='4');

        return response()->json($msg, $msg['status']);
    }

    public function patient(Request $request) {
        $msg = $this->create($request, $role='5');

        return response()->json($msg, $msg['status']);
    }

    public function create($request, $role)
    {
        $this->validateRequest($request);
        $verifycode = Str::random(6);
        //start temporay transaction
        DB::beginTransaction();

        try{
           $user = User::create([
                'fullname'     => $request->input('fullname'),
                'email'    => $request->input('email'),
                'photo'    => 'noimage.jpg',
                'password' => Hash::make($request->input('password')),
                'phone'    => $request->input('phone'),
                'role'     => $role,
                'verifycode' => $verifycode
            ]);

            $msg['message'] = 'A verification code has been sent to your email, please use to veriify your account, also check your spam folder for email';
            $msg['user']    = $user;

            //Send a mail form account verification
            Mail::to($user->email)->send(new WelcomeMail($user));
            //if operation was successful save commit save to database
            DB::commit();
            $msg['status'] = 201;
            return $msg;


        }catch(\Exception $e) {
            //if any operation fails, Thanos snaps finger - user was not created rollback what is saved
            DB::rollBack();

            $msg['message'] = "Error: Account not created, please try again!";
            $msg['user'] = null;
            $msg['hint'] = $e->getMessage();
            $msg['status'] = 501;
            return $msg;
        }
    }

    public function validateRequest(Request $request){
            $rules = [
                'email'    => 'required|email|unique:users',
                'fullname'     => 'required|string',
                'password' => 'required|min:8|confirmed',
            ];
            $messages = [
                'required' => ':attribute is required',
                'email'    => ':attribute not a valid format',
            ];
        $this->validate($request, $rules, $messages);
    }

    // protected function validator(array $data)
    // {
    //     return Validator::make($data, [
    //         'name' => ['required', 'string', 'max:255'],
    //         'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
    //         'password' => ['required', 'string', 'min:8', 'confirmed'],
    //     ]);
    // }
}
