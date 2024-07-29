<?php
session_start();

include_once "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $idUser = $_POST['id_user'];

    // Query untuk mengambil data user berdasarkan id_user
    $sql = "SELECT * FROM user WHERE id_user='$idUser'";
    $result = $koneksi->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // Buat array data user
        $userData = array(
            'id_user' => $row['id_user'],
            'nama_lengkap' => $row['nama_lengkap'],
            'alamat' => $row['alamat'],
            // Tambahkan field lain yang dibutuhkan
        );
        echo json_encode($userData);
    } else {
        echo json_encode(array("error" => "User tidak ditemukan"));
    }
} else {
    echo json_encode(array("error" => "Metode tidak diizinkan"));
}

$koneksi->close();
?>
