<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Patient;

class PatientController extends Controller
{
    /**
     * Gets all visitors for a signed in user
     */
    public function Allpatients(Request $request)
    {
        $visitors = Pat::wienthere('user_id', $this->user->id)->get();

        if ($visitors->isEmpty()) {
            return response()->json([
                'Message'   => "No Visitors found for this user",
                'status' => false
            ], 404);
        } else {
            // send response with the visitors' details
            return response()->json([
                'visitors' => $visitors->count(),
                'visitor'   => $visitors,
                'status' => true
            ], 200);
        }
    }
}
