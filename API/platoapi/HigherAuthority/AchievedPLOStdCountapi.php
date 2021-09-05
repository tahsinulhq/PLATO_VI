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
		
    echo '{"result": "post received"}';
		break;
	case 'POST':
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
    fetchAttemptedPLOStdCount($data);
        
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

function fetchAttemptedPLOStdCount($data) {
include "dbconnect.php";
    $pid = $data["pid"];
    $semester = $data["semester"];
    $year = $data["year"];

    $sql = "
SELECT p.PLONum, COUNT(DISTINCT s.StudentID) as Stcount
                FROM student_t s,
                     assessment_t a, 
                     evaluation_t e,
                     co_t co, 
                     plo_t p,
                     section_t se,
                     course_t c,
                     program_t pr
                WHERE pr.ProgramID = '$pid'
                     and  se.Semester = '$semester'
                     and  se.s_year = '$year'
                     and c.ProgramID = pr.ProgramID
                     and se.CourseID = c.CourseID
                     and  se.SectionID = e.SectionID
                     and s.StudentID = e.StudentID
                     and e.AssessmentID = a.AssessmentID
                    and a.COID=co.COID and co.PLOID = p.PLOID
                GROUP BY  p.PLOID    
                HAVING 100*(sum(e.ObtainedMarks)/sum(a.Marks))>=40
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