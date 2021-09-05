<?php
//declaring that we need json as out content-type in the header
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json");
header("Access-Control-Allow-Headers: *");

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
	case 'GET':
		CoursesOperation();
		
        $data = json_decode(file_get_contents('php://input'), true);
        fetchStudentIDOperation($data);
		break;
	case 'POST':

		$data = json_decode(file_get_contents('php://input'), true);  // true means you can convert data to array
		postCOoperation($data);
		break;
	case 'PUT':
		echo '{"result": "put received"}';
		break;
	case 'DELETE':
		echo '{"message": "successfully deleted"}';
		break;
	
	default:
		echo '{"message": "not supported"}';
		break;
}

function CoursesOperation(){
	 include "dbconnect.php";

    $sql = "SELECT c.CourseID, s.semester, s.year
    FROM course_t AS c, section_t AS s
    WHERE c.CourseID = s.CourseID";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // output data of each row
      $rows = array();
       while($r = mysqli_fetch_assoc($result)) {
          $rows["result"][] = $r; // with result object
        //  $rows[] = $r; // only array
       }
      echo json_encode($rows);

    } else {
        echo '{"result": "No data found"}';
    }
  }


function fetchStudentIDOperation($data) {
include "dbconnect.php";
    $stid = $data["stid"];
    // $pid = $data["pid"];
    // $progid = $data["programID"];
    // $edate = $data["enrollDate"];
    // $assid = $data["assID"];

    $sql = "
    SELECT * 
    FROM student_t AS s
    WHERE s.StudentID = '$stid'
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

?>