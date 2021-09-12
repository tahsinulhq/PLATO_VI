<?php
//declaring that we need json as out content-type in the header
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json");
header("Access-Control-Allow-Headers: *");
header("Accept: application/json");
header("Authorization: Some token");


$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
	case 'GET':
		fetchAchievedPLOCourse();
    // echo '{"result": "post received"}';
		break;
	case 'POST':

    echo '{"result": "post received"}';
    // $json = file_get_contents('php://input');
    // $data = json_decode($json, true);
    // fetchAchievedPLOCourse($data);
        
		break;
	case 'PUT':
		echo '{"result": "put received"}';
		break;
	case 'DELETE':
		echo '{"message": "successfully deleted"}';
		break;
	
	default:
		echo '{"message": "enter valid request."}';
		break;
}

function fetchAchievedPLOCourse() {
include "dbconnect.php";

    $sql = "
    SELECT CourseID
    FROM course_t
    ";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // output data of each row
      $rows = array();
       while($r = mysqli_fetch_assoc($result)) {
          // $rows["result"][] = $r; // with result object
         $rows[] = $r; // only array
       }
      echo json_encode($rows);

    } else {
        echo '{"result": "No data found"}';
    }
}







// $action = $_POST["action"];


// // Get all employee records from the database
//     if("GET_ALL" == $action){
//         $db_data = array();
//         $sql = " 
//         SELECT CourseID
//         FROM course_t
//         ";

//         $result = $conn->query($sql);

//         if($result->num_rows > 0){
//             while($row = $result->fetch_assoc()){
//                 $db_data[] = $row;
//             }
//             // Send back the complete records as a json
//             echo json_encode($db_data);
//         }

//         else{
//             echo "error";
//         }
        
//         $conn->close();
//         return;
//     }





?>