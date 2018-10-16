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

	//Goi ham munfatctures
	public function getAllManufactures()
	{
		$sql = "SELECT * FROM manufactures ";
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
			$next = "<a href='$url?page=$nextp' style='color:blue;'> > </a>";
			$prev = "<a href='$url?page=$pre' style='color:blue;'> < </a>";

		}


		$fprev = "<a href='$url' style='color:blue;'> < </a>";
		$fnext = "<a href='$url?page=$total_links' style='color:blue;'> > </a>";

		for ($j=1; $j <= $total_links ; $j++)
		 { 
			$link = $link. "<a href='$url?page=$j' style='color:blue;'> $j </a>";
			
		}
		return $fprev.$prev.$link.$next.$fnext;
	}
///PRODUCT
	//Ham them san pham
	public function addProduct ($name, $image, $description, $manu_ID, $type_ID, $price)
	{
		$sql = 'INSERT INTO product (name, image, description, manu_ID, type_ID, price) VALUES ("'.$name.'","'.$image.'", "'.$description.'", "'.$manu_ID.'", "'.$type_ID.'", "'.$price.'")';
		return self::$conn->query($sql);
	}
	public function getProductByID($id)
    {
    	$sql ='SELECT * FROM product WHERE ID ="'.$id.'"';
    	$result = self::$conn->query($sql);
    	return $this->getData($result);
    }

    public function getProduct()
	{
		$sql = "SELECT * FROM product";
		$result = self::$conn->query($sql);
		return $this->getData($result);
	} 

	//Ham sua san pham
	public function editProduct ($name, $image, $description, $manu_ID, $type_ID, $price)
	{
		$sql = 'UPDATE product SET name="'.$name.'", image= "'.$image.'", description= "'.$description.'", manu_ID= "'.$manu_ID.'", type_ID= "'.$type_ID.'", price= "'.$price.'")';
		return self::$conn->query($sql);
	}

///MANUFACTURES
	//Ham them trong manufactures
	public function getManufacturesByID($id)
    {
    	$sql ='SELECT * FROM manufactures WHERE manu_ID ="'.$id.'"';
    	$result = self::$conn->query($sql);
    	return $this->getData($result);
    }

	public function addManufacters ($name, $image)
	{
		$sql = 'INSERT INTO manufactures (manu_name, manu_img) VALUES ("'.$name.'","'.$image.'")';
		return self::$conn->query($sql);
	}

	public function getManufactures()
	{
		$sql = "SELECT * FROM manufactures";
		$result = self::$conn->query($sql);
		return $this->getData($result);
	}   

	public function editManufactures ($id, $name, $image)
	{
		$sql ='UPDATE manufactures SET name="'.$name.'", image= "'.$image.'" WHERE manu_ID="'.$id.'"';
		return self::$conn->query($sql);
	} 
     
    //Ham them protypes
    public function getProtypesByID($id)
    {
    	$sql ='SELECT * FROM protypes WHERE type_ID ="'.$id.'"';
    	$result = self::$conn->query($sql);
    	return $this->getData($result);
    }
    public function addProtypes ($name, $image)
	{
		$sql = 'INSERT INTO manufactures (type_name, type_img) VALUES ("'.$name.'","'.$image.'")';
		return self::$conn->query($sql);
	}
	public function getProtypes()
	{
		$sql = "SELECT * FROM protypes";
		$result = self::$conn->query($sql);
		return $this->getData($result);
	} 
	public function editProtypes ($id, $name, $image)
	{
		$sql ='UPDATE protypes SET type_name="'.$name.'", type_image= "'.$image.'" WHERE type_ID="'.$id.'"';
		return self::$conn->query($sql);
	}  


                      
}

 ?>
