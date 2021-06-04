<?php 
	session_start(); 
	if(isset($_GET['id']) && is_numeric($_GET['id'])){
		$product_id=$_GET['id'];
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>eco. online store</title>
		<!-- META -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
		<!-- JavaScript -->
		<script type="text/javascript" src="app.js" defer></script>
	</head>

	<body>
		<div class="cart_grid_container">			
			<header class="header">
				<div class="supNav">
					<div class="supNav_logo">
						<a href="index.php"><img src="img/logo.png" alt="logo"></a>
					</div>
					<div class="supNav_Right">
						<?php 
							if(isset($_SESSION['welcome'])) echo $_SESSION['welcome']; 
							if(isset($_SESSION['welcome'])){
								echo '<a href="logout.php"><i class="fas fa-power-off" style="color:#E94F37"></i></a>';
							}else{
								echo '<a href="login.php"><i class="far fa-user-circle"></i></a>';
							}
						?>
						<a href="cart.php"><i class="fas fa-shopping-bag"></i><span><?php if(isset($_SESSION['totalItems'])) echo $_SESSION['totalItems']; ?></span></a>
					</div>
				</div>
			</header>

			<nav class="navbar">
				<ul>
					<?php 
						function getCategories(){
							$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
							$req=$pdo->query("SELECT DISTINCT category FROM products ORDER BY category");
							$data=$req->fetchAll();
							return $data;
						};

						$categories=getCategories();
						foreach($categories as $key => $value){
							echo '<li><a href="category.php?cat='.$value["category"].'">'.$value["category"].'</a></li>';
						}
					?>
				</ul>
			</nav>

			<!-- ### ADD TO CART ### -->
			<?php
				if(isset($_POST['buyBtn'])){
					function createCart(){
						if(!isset($_SESSION['cart'])){
							$_SESSION['cart']=array();
							$_SESSION['cart']['product_img']=array();
							$_SESSION['cart']['name']=array();
							$_SESSION['cart']['brand']=array();
							$_SESSION['cart']['product_id']=array();
							$_SESSION['cart']['quantity']=array();
							$_SESSION['cart']['price']=array();
						}
					}
					function addToCart($product_img,$name,$brand,$product_id,$quantity,$price){
						createCart();
						$productPosition=array_search($product_id,$_SESSION['cart']['product_id']);
						if($productPosition!==false){
							$_SESSION['cart']['quantity'][$productPosition]+=$quantity;
						}else{
							$_SESSION['cart']['product_img'][]=$product_img;
							$_SESSION['cart']['name'][]=$name;
							$_SESSION['cart']['brand'][]=$brand;
							$_SESSION['cart']['product_id'][]=$product_id;
							if($quantity!=0 || $quantity!=''){
								$_SESSION['cart']['quantity'][]=$quantity;
							}else{header('location:index.php');}						
							$_SESSION['cart']['price'][]=$price;
						}
					}
					function totalPrice(){
						$total=0;
						for($i=0;$i<count($_SESSION['cart']['product_id']);$i++){
							$total+=$_SESSION['cart']['quantity'][$i]*$_SESSION['cart']['price'][$i];
						}
						return round($total,2);
					}
					$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
					$req=$pdo->query("SELECT * FROM products WHERE product_id='$product_id'");
					$data=$req->fetch();
					addToCart($data['product_img'],$data['name'],$data['brand'],$product_id,$_POST['quantity'],$data['price']);
					$_SESSION['addedToCart']='Your item is now in your cart!';
					header('location:product.php?id='.$product_id);
				}
				if(isset($_SESSION['cart'])){
					function totalItems(){
						$total=0;
						for($i=0;$i<count($_SESSION['cart']['product_id']);$i++){
							$total+=$_SESSION['cart']['quantity'][$i];
						}
						return $total;
					}
					$_SESSION['totalItems']=totalItems();
				}
			?>
			<!-- ### CLEAN CART ### -->	
			<?php 
				if(isset($_GET['delete'])&&$_GET['delete']=='yes'){
					if(isset($_SESSION['cart'])) unset($_SESSION['cart']);
					if(isset($_SESSION['totalItems'])) unset($_SESSION['totalItems']);
					header('location:index.php');
				}
			?>
			<!-- ### SHOW CART ### -->
			<table border=3>
				<tr>
					<td class="cart_table-title" colspan="5">YOUR CART</td>
				</tr>
				<tr class="cart_table-subtitle">
					<th>Product</th>
					<th>Name</th>
					<th>Brand</th>
					<th>Quantity</th>
					<th>Price</th>
				</tr>
				<?php 
					if(empty($_SESSION['cart']['product_id'])){
						echo '<tr><td class="empty_cart" colspan="5"><i class="fas fa-ban"></i> Your cart is empty !</td></tr>';
					}else{
						for($i=0;$i<count($_SESSION['cart']['product_id']);$i++){
							echo "<tr><td><img src='".$_SESSION['cart']['product_img'][$i]."' alt='".$_SESSION['cart']['name'][$i]."'></td>";
							echo "<td>".$_SESSION['cart']['name'][$i]."</td>";
							echo "<td>".$_SESSION['cart']['brand'][$i]."</td>";
							echo "<td>".$_SESSION['cart']['quantity'][$i]."</td>";
							echo "<td>".$_SESSION['cart']['price'][$i]."</td></tr>";
						}
						function totalPrice(){
							$total=0;
							for($i=0;$i<count($_SESSION['cart']['product_id']);$i++){
								$total+=$_SESSION['cart']['quantity'][$i]*$_SESSION['cart']['price'][$i];
							}
							return round($total,2);
						}
						echo "<tr><th class='total' colspan='4'>TOTAL</th><td>".totalPrice()."$</td></tr>";
					}
				?>
			</table>
			<div class="cart_table-footer">
				<?php 
					if(!empty($_SESSION['cart']['product_id'])){
						echo '<a href="?delete=yes"><button id="delete"><i class="far fa-trash-alt"></i> Delete All</button></a>';
						if(isset($_SESSION['welcome'])){
							echo '<button id="payment"><i class="fas fa-credit-card"></i> PAYMENT</button>';
						}else{
							echo '<p><a href="login.php" style="font-weight: bold;">Log in</a> for payment.</p>';
						}
					}
				?>			
			</div>
<?php include 'footer.php'; ?>