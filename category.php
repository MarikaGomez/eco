<?php 
	session_start(); 
	if(isset($_GET['cat']) && !is_numeric($_GET['cat'])){
		$cat=$_GET['cat'];
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
		<div class="grid_container">			
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
						echo '<li id="brands">BRANDS</li>';
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
			<div class="brandsDiv">
				<?php 
					function getBrands($cat){
						$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
						$req=$pdo->prepare("SELECT DISTINCT brand FROM products WHERE category=? ORDER BY brand");
						$req->execute(array($cat));
						$data=$req->fetchAll();
						return $data;
					}
					$brands=getBrands($cat);
					echo "<ul class='brandsList'>";
					foreach($brands as $brand => $value){
						echo '<li class="hiddenList"><a href="?cat='.$cat.'&brand='.$value["brand"].'">'.$value["brand"].'</a></li>';
					}
					echo "</ul>";
				?>
			</div>
			
			<section class="banner">
				<h1 class="section_banner_title">eco. online store</h1>
				<h3 class="section_banner_subtitle">SKINCARE, HAIR AND BEAUTY PRODUCT</h3>
			</section>

			<section class="core">
				<h2 class="section_core_title section_core_title-mustHave" style="text-transform: uppercase;"><?=$cat; ?></h2>
				<div class="section_core_img-mustHave">
					<?php
						if(isset($_GET['brand'])){
							$seletedBrand=$_GET['brand'];

							function getProdFromCatByBrand($cat,$brand){
								$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
								$req=$pdo->prepare('SELECT * FROM products WHERE category=? AND brand=? ORDER BY product_id DESC');
								$req->execute(array($cat,$brand));
								$data=$req->fetchAll(PDO::FETCH_OBJ);
								return $data;
							}
							$productsFromCatByBrand=getProdFromCatByBrand($cat,$seletedBrand);
							foreach($productsFromCatByBrand as $product){
								echo '<div class="mustHave_product">';
								echo '<a href="product.php?id='.$product->product_id.'">';
								echo '<img class="mustHave_product_img" src="'.$product->product_img.'" alt="'.$product->name.'">';
								echo '<p class="mustHave_product_brand">'.$product->brand.'</p>';
								echo '<p class="mustHave_product_name">'.$product->name.'</p>';
								echo '<p class="mustHave_product_price">$'.$product->price.'</p></a></div>';
							}
							
						}else{
							function getProductsFromCategory($cat){
								$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
								$req=$pdo->prepare('SELECT * FROM products WHERE category=? ORDER BY name');
								$req->execute(array($cat));
								$data=$req->fetchAll(PDO::FETCH_OBJ);
								return $data;
							};

							$products=getProductsFromCategory($cat);					
							
							foreach($products as $product){
								echo '<div class="mustHave_product">';
								echo '<a href="product.php?id='.$product->product_id.'">';
								echo '<img class="mustHave_product_img" src="'.$product->product_img.'" alt="'.$product->name.'">';
								echo '<p class="mustHave_product_brand">'.$product->brand.'</p>';
								echo '<p class="mustHave_product_name">'.$product->name.'</p>';
								echo '<p class="mustHave_product_price">$'.$product->price.'</p></a></div>';
							}
						}
					?>
				</div>
			</section>	

<?php include 'footer.php'; ?>