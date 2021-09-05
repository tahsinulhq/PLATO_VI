<?php
//declaring that we need json as out content-type in the header
header('Access-Control-Allow-Origin: *');
header("Content-type: application/json");
header("Access-Control-Allow-Headers: *");

include "dbconnect.php";

		$url = "localhost/platoapi/test.php/1711619";
        $data = json_decode(file_get_contents($url), true);
        

        $sql = "
    SELECT * 
    FROM student_t AS s
    WHERE s.StudentID = '$data'
    ";

    $result = mysqli_query($conn, $sql);
    echo "id: ", $data['id'];

?>