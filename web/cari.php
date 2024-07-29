<?php
include "koneksi.php";

$query = $_POST['query'];
$sql = "SELECT * FROM laporan_harian WHERE absensi LIKE '%$query%' OR datetimeinput LIKE '%$query%' OR nama_karyawan LIKE '%$query%'";
$result = $koneksi->query($sql);

$laporan = array();

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $laporan[] = $row;
  }
}

echo json_encode($laporan);

$koneksi->close();
?>