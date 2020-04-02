<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Patient;
use App\Practitioner;

class PractitionerController extends Controller
{
    /**
     * Gets all practitioners for a signed in hospital nurse/user
     */
    public function AllPractitioners(Request $request)
    {
        $practitioners = Practitioner::wienthere('user_id', $this->user->id)->get();

        if ($practitioners->isEmpty()) {
            return response()->json([
                'Message'   => "No practitioners found",
                'status' => false
            ], 404);
        } else {
            // send response with the practitioners' details
            return response()->json([
                'practitioners' => $practitioners->count(),
                'practitioner'   => $practitioners,
                'status' => true
            ], 200);
        }
    }

    /**
     * Method to display all patients of the hospital whom
     * the doctor is assigned to
     */
    public function viewpatients()
    {
        // get user id
        $user_id = Practitioner::where([
        	['staff_id', $this->user->id],
        	['request_status', 1],
        ])->pluck('user_id');

        // get patients with the user_id
        $patients = Patient::whereIn('doctor_id', $user_id)
        	->with('user')
        	->get();

        // list out patients details
        if ($patients){
            return response()->json([
              'patients' => $patients->count(),
              'patient' => $patients,
              'status' => true
            ], 200);
        }
        else {
          return response()->json([
              'message' => 'No patients found for you at this time',
              'status' => false
            ], 404);
        }
    }

    public function admitPatient(Request $request)
    {
        $patient = Patient::where('qr_code', $request->input('qr_code'))
                            ->where('patient_id', $request->input('patient_id'))->first();

        if ($patient){
            //Error Handling
            $hospital_id = $patient->user_id;
            $patient_id = $patient->id;

            // Check that practitioner works for user
            $hospitalpractitioner = practitioner::where([
                ['practitioner_id', $this->user->id],
                ['user_id', $hospital_id],
                ['request_status', 1],
            ])->first();

            if ($hospitalpractitioner){
                 patient::where('id', $patient_id)->update(['time_in' => NOW()]);

                // $apatient = patient::where('id', $hospital)->update(['time_in' => NOW(), 'status' => 1]);

                $patient = patient::where('id', $patient_id)->with(['user' => function($query){
                    $query->with(['home' => function($query){
                        $query->with('estate');
                     }]);
                 }])->first();
                
                $res ['Message'] = "patient Has been checked in succesfully";
                $res ['patient details'] = $patient;
            	return response()->json($res, 202);
            }
            else {
                $res['Error'] = "Permission Denied!- You can not admit this hospital's patients";
            	return response()->json($res, 403);
            }
        }
        else {
            $res['Error'] = $request->input('qr_code'). " This QR code does not exist";
            return response()->json($res, 404);
        }
    }


    /**
     * Updates a practitioner details for an estate
     *
     * @return \Illuminate\Http\Response
     */
    public function updatePractitioner(
        $staff_id,
        $id,
        Request $request
    ){
        // Verifies that the logged-in user is assigned to the requested estate
        $user_staff = Hospital::whereUserIdAndHospitalId($this->user->id, $user_id)->first();

        if (is_null($user_staff)) {
            return response()->json([
                'status' => false,
                'message'=> "Unauthorized!",
            ], 401);
        }
        else
        {
            $practitioner = User::join('hospital', 'hospital.user_id', 'users.id')
                ->where('users.id', $id)
                ->where('users.user_type', 'practitioner')
                ->where('hospital.hospital_id', $staff_id)
                ->get();

            // Check if such user exists as a practitioner for the hospital
            if (!$practitioner->isEmpty()) {
                // Validate the posted data
                $this->validate($request, [
                    'fullname'  => ['regex:/^([a-zA-Z]+)(\s[a-zA-Z]+)*$/'],
                    'phone' => ['string'],
                    'job_name' => ['string'],
                    'hospital_name' => ['string'],
                ]);

                $updatedUser = Practitioner::find($id);

                // Update user's details
                $updatedUser->fullname  = $request->fullname ?? $updatedUser->fullname;
                $updatedUser->phone = $request->phone ?? $updatedUser->phone;
                $updatedUser->duty_time = $request->duty_time ?? $updatedUser->duty_time;
                $updatedUser->job_name = $request->job_name?? $updatedUser->job_name;
                $updatedUser->hospital_name = $request->hospital_name ?? $updatedUser->hospital_name;

                // Save the update
                $updatedUser->save();

                // Return response
                return response()->json([
                    'status'  => true,
                    'message' => "The practitioner's record has successfully been updated",
                    'result'  => $updatedUser
                ], 200);
            }
            else
            {
                return response()->json([
                    'status' => false,
                    'message' => "We cannot verify the user with id: {$id} as a practitioner assigned to ". Estate::find($estate_id)->estate_name,
                ], 406);
            }
        }
    }
}
