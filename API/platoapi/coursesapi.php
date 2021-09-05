<?php
//declaring that we need json as out content-type in the header
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json");
header("Access-Control-Allow-Headers: *");

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
	case 'GET':
		// CoursesOperation();
		// handleGetOperation1();
        // $url = "localhost/platoapi/coursesapi.php/1711619";
        $data = json_decode(file_get_contents('php://input'), true);
        fetchStudentDataOperation($data);
		break;
	case 'POST':

		$data = json_decode(file_get_contents('php://input'), true);  // true means you can convert data to array
		fetchStudentIDOperation($data);
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

function handleGetOperation1(){
     include "dbconnect.php";

    $sql = "SELECT CourseID FROM course_t";

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

function fetchStudentDataOperation($data) {
include "dbconnect.php";

    $stid = $data["stid"];
    $pid = $data["pid"];
    // $progid = $data["programID"];
    // $edate = $data["enrollDate"];
    // $assid = $data["assID"];

    $sql = "
    SELECT p.PLONum,se.CourseID,100*(sum( e.ObtainedMarks)/sum(a.Marks)) as PLO_Percent, 'Achieved PLO' AS PloOutcome
      FROM student_t s, assessment_t a, evaluation_t e, co_t co, plo_t p, section_t se 
      WHERE s.StudentID = '$stid' 
      and s.ProgramID='$pid'
      and se.SectionID = e.SectionID 
      and s.StudentID = e.StudentID 
      and e.AssessmentID = a.AssessmentID 
      and a.COID=co.COID 
      and co.PLOID = p.PLOID 
      GROUP BY p.PLOID
      HAVING PLO_Percent>=40

    ";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        // output data of each row
      $rows = array();
       while($r = mysqli_fetch_assoc($result)) {
          $rows["result"][] = $r; // with result object
         // $rows[] = $r; // only array
       }
      echo json_encode($rows);

    } else {
        echo '{"result": "No data found"}';
    }
}

?>