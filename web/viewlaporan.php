<?php
include "koneksi.php";
session_start();

$id_user = $_GET['id_user'];

// Periksa apakah id_user ada
if (empty($id_user)) {
    echo json_encode(array("message" => "id_user tidak ditemukan"));
    exit;
}

$sql = "SELECT laporan_harian.id_laporan, laporan_harian.datetimeinput, laporan_harian.absensi, laporan_harian.luas, laporan_harian.janjang, laporan_harian.catatan, 
        divisi.nama_divisi, blok.nama_blok, karyawan.nama_karyawan 
        FROM laporan_harian
        JOIN divisi ON laporan_harian.id_divisi = divisi.id_divisi
        JOIN blok ON laporan_harian.id_blok = blok.id_blok
        JOIN karyawan ON laporan_harian.id_karyawan = karyawan.id_karyawan
        WHERE laporan_harian.id_user = '$id_user'
        ORDER BY laporan_harian.created_at DESC";

$result = $koneksi->query($sql);

$laporanList = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $laporanList[] = $row;
    }
} else {
    echo json_encode(array("message" => "Tidak ada laporan ditemukan"));
    exit;
}

echo json_encode($laporanList);

$koneksi->close();
?>
