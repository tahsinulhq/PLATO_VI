<?php
//declaring that we need json as out content-type in the header
header("Access-Control-Allow-Origin: *");
header("Content-type: application/json");
header("Access-Control-Allow-Headers: *");
header("Accept: application/json");
//header("Authorization: Some token");

$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
	case 'GET':
		
        echo '{"result": "get received"}';
		break;
	case 'POST':
        $json = file_get_contents('php://input');
        $data = json_decode($json, true);
        fetchAvgPLOGraphOperation($data);
        
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

function fetchAvgPLOGraphOperation($data) {
include "dbconnect.php";
    $co = $data["co"];
    $sec = $data["sec"];
    $qno = $data["qno"];
    $totmark = $data["totmark"];
    $assessname = $data["assessname"];

    $sql = "
    INSERT INTO assessment_t(SectionID, COID, QuestionNum, AssessmentName, Marks)
	VALUES('$sec', '$co', '$qno', '$assessname', '$totmark')
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