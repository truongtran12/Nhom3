<?php 
	include 'config.php';
	include 'db.php';
	$manufactures = new Manufactures();
	$manufactures = $manufactures->getManufacturesByID();
	//manufactures
	if (isset($_POST['add'])) {
		$targetDir = "public/manufactures/";
		$targetFile = $targetDir.basename($_FILES["fileUpload"]["name"]);
		$upload = 1;
		$imageFileType = pathinfo($targetFile, PATHINFO_EXTENSION);

		//Kiem tra file hinh
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
			if (move_uploaded_file($_FILE["fileUpload"]["tmp_name"], $targetFile) && $db->addManufacters($_POST['manu_name'], $_FILES["fileUpload"]["name"])) {
				echo "Thanh cong";
				header('location:form_manufacture.php');
			}else{
				echo "Erro!";
			}
		}
	}

	//EDIT
	if (isset($_POST['editManufactures'])) {
		$targetDir = "public/manufactures/";
		$targetFile = $targetDir.basename($_FILES["fileUpload"]["name"]);
		$upload = 1;
		$imageFileType = pathinfo($targetFile, PATHINFO_EXTENSION);

		//Kiem tra file hinh
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
			if (move_uploaded_file($_FILE["fileUpload"]["tmp_name"], $targetFile) && $manufactures->editManufactures($_GET['id'], $_POST["manu_name"], $_FILES['fileUpload']["name"])) {
				echo "Thanh cong";
				header('location:manufacture.php');
			}else{
				echo "Erro!";
			}
		}
	}


	
	//PRODUCT
	if (isset($_POST['edit'])) {
		$targetDir = "public/product/";
		$targetFile = $targetDir.basename($_FILES["fileUpload"]["name"]);
		$upload = 1;
		$imageFileType = pathinfo($targetFile, PATHINFO_EXTENSION);

		//Kiem tra file hinh
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
			if (move_uploaded_file($_FILE["fileUpload"]["tmp_name"], $targetFile) && $product->editProduct($_GET['ID'], $_POST['name'], $_POST['price'], $_FILES["fileUpload"]["name"], $_POST['description'], $_POST['manu_ID'], $_POST['type_ID'])) {
				echo "Thanh cong";
				header('location:index.php');
			}else{
				echo "Erro!";
			}
		}
	}
	
}

 ?>