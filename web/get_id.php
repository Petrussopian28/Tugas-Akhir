<?php
session_start();
include "koneksi.php";

$id_user = $_POST['id_user'];

$sql = "SELECT * FROM user WHERE id_user='$id_user'";
$result = $koneksi->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['status' => 'success', 'username' => $row['username']]);
} else {
    echo json_encode(['status' => 'error']);
}

$koneksi->close();
?>
