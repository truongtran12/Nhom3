<?php 
class Db{
	//Tạo biến $conn kết nối
	public static $conn;
	//Tạo kết nối trong hàm construct
	public function __construct(){
		self::$conn = new mysqli(DB_HOST,DB_USER,DB_PASS,DB_NAME);
		self::$conn->set_charset('utf8');
	}
	public function __destruct(){
		self::$conn->close();
	}
	public function getData($obj){
		$arr = array();
		while($row = $obj->fetch_assoc()){
			$arr[]=$row;
		}
		return $arr;
	}
	
	//Hàm lấy tất cả sản phẩm
	public function getAllProduct($page,$per_page)
	{
		$first = ($page - 1) * $per_page;
		$sql = "SELECT * FROM product JOIN manufactures on product.manu_ID = manufactures.manu_ID JOIN protypes ON protypes.type_ID = product.type_ID LIMIT $first,$per_page";
		$result = self::$conn->query($sql);
		return $this->getData($result);
	}

	//Ham tiem kiem san pham
	public function seachProduct($name)
	{
		$sql = "SELECT * FROM product JOIN manufactures on product.manu_ID = manufactures.manu_ID JOIN protypes ON protypes.type_ID = product.type_ID WHERE product.name LIKE '%$name%'
";
		$result = self::$conn->query($sql);
		return $this->getData($result);
	}

	public function countAllProducts()
	{
		$sql = "SELECT COUNT(*) FROM product";
		$result = self::$conn->query($sql);
		return $this->getData($result);
	}
	//Ham phan trang
	public function createPageLinks($url, $total, $page, $per_page)
	{
		$total_links = ceil($total/$per_page);
		$link = "";
		$nextp = $page + 1;
		$pre = $page - 1;
		if($page > 1) $page = 1;
		{
			$next = "<a href='$url?page=$nextp' style='color:red;'> > </a>";
			$prev = "<a href='$url?page=$pre' style='color:red;'> < </a>";

		}


		$fprev = "<a href='$url' style='color:red;'> << </a>";
		$fnext = "<a href='$url?page=$total_links' style='color:red;'> >> </a>";

		for ($j=1; $j <= $total_links ; $j++)
		 { 
			$link = $link. "<a href='$url?page=$j' style='color:red;'> $j </a>";
			
		}
		return $fprev.$prev.$link.$next.$fnext;
	}
}
 ?>
