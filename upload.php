<?php 
	include 'config.php';
	include 'db.php';
	if (isset($_POST['add'])) {
		$targetDir = "public/upload/";
		$targetFile = $targetDir.basename(time().$_FILES["fileUpload"]["name"]);
		$upload = 1;
		$imageFileType = pathinfo($targetFile, PATHINFO_EXTENSION);

		//Kiem tra fule hinh
		$check = getimagesize($_FILES["fileUpload"]["tmp_name"]);
		if ($check !== false) {
			$upload = 1;
		}else{
			$upload = 0;
		}

		if ($upload == 0) {
			echo "Khong thanh cong";
		}else{
			$db = new Db();
			if (move_uploaded_file($_FILE["fileUpload"]["tmp_name"], $targetFile) && $db->addManufactures($_POST['manu_name'], $$targetFile)) {
				echo "Thanh cong";
				header('location:form_manufactures.php');
			}else{
				echo "Erro!";
			}
		}
	}
 ?>