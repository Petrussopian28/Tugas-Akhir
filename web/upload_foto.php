<?php
include_once "koneksi.php";

$id_user = $_POST['id_user'];

if ($_FILES['foto']['name']) {
    $target_dir = "assets/";
    $target_file = $target_dir . basename($_FILES["foto"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    $check = getimagesize($_FILES["foto"]["tmp_name"]);
    if ($check !== false) {
        if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_file)) {
            $sql = "UPDATE user SET foto='$target_file' WHERE id_user='$id_user'";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(array("status" => "success", "message" => "File uploaded successfully", "foto" => basename($_FILES["foto"]["name"])));
            } else {
                echo json_encode(array("status" => "error", "message" => "Error updating record: " . $conn->error));
            }
        } else {
            echo json_encode(array("status" => "error", "message" => "Sorry, there was an error uploading your file."));
        }
    } else {
        echo json_encode(array("status" => "error", "message" => "File is not an image."));
    }
} else {
    echo json_encode(array("status" => "error", "message" => "No file was uploaded."));
}

$conn->close();
?>
