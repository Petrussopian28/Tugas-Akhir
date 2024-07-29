<?php
include_once "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_user = $_POST['id_user'];

    $sql = "SELECT * FROM user WHERE id_user='$id_user'";
    $result = $koneksi->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode(array(
            "status" => "success",
            "username" => $row['username'],
            "nama_lengkap" => $row['nama_lengkap'],
            "alamat" => $row['alamat']
        ));
    } else {
        echo json_encode(array("status" => "error", "message" => "User tidak ditemukan"));
    }
} else {
    echo json_encode(array("status" => "error", "message" => "Metode tidak diizinkan"));
}

$koneksi->close();
?>
