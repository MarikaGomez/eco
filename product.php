<?php session_start(); ?>
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
		<div class="product_grid_container">			
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

			<section class="focus_product">
				<div class="focus_product_zoom">
				<?php
					if(isset($_GET['id']) && is_numeric($_GET['id'])){
						$product_id=$_GET['id'];
					}else{
						header('location:index.php');
					}

					function showProduct($id){
						$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
						$req=$pdo->prepare('SELECT * FROM products WHERE product_id=?');
						$req->execute(array($id));
						$data=$req->fetch(PDO::FETCH_OBJ);
						return $data;
					};

					$product=showProduct($product_id);
					$productBrand=$product->brand;
					
					echo '<img id="focus_product_zoom_img" class="focus_product_img-zoom" src="'.$product->product_img.'" alt="'.$product->name.'">';
					echo '<div class="focus_product_views">';
					echo '<img class="focus_thumbnail_img active" src="'.$product->product_img.'" alt="'.$product->name.'">';
					echo '<img class="focus_thumbnail_img" src="'.$product->product_img2.'" alt="'.$product->name.'">';
					echo '<img class="focus_thumbnail_img" src="'.$product->product_img3.'" alt="'.$product->name.'">';
					echo '<img class="focus_thumbnail_img" src="'.$product->product_img4.'" alt="'.$product->name.'"></div></div>';
					echo '<div class="focus_product_details"><form method="POST" action="cart.php?id='.$product_id.'">';
					echo '<h1 class="focus_product_details-title">'.$product->name.'</h1>';
					echo '<p class="focus_product_details-brand">'.$product->brand.'</p>';
					echo '<p class="focus_product_details-price">$'.$product->price.'</p>';
					echo '<div class="input"><input type="number" name="quantity" min="1" max="10" value="1"></div>';
					echo '<div><p id="infosTitle-desc" class="product_details-infosTitle">Product description</p>';
					echo '<p id="showDefault" class="product_details-infos">'.$product->details.'</p><hr>';
					echo '<p id="infosTitle-compo" class="product_details-infosTitle">Production composition</p>';
					echo '<p id="hidden" class="product_details-infos hidden">'.$product->compo.'</p><br>';
					echo '<div class="product_buttons">';
					echo '<button id="buyBtn" class="product_btn-buy" name="buyBtn"><i class="fas fa-shopping-bag"></i> ADD TO BAG</button>';
					if(isset($_SESSION['addedToCart'])){
						echo $_SESSION['addedToCart'];
						unset($_SESSION['addedToCart']);
					}		
				?>
				</div>
			</section>

			<section class="products_advertisement">
				<h2 class="products_ad-title">You may also like</h2>
				<div class="products_ad_img">
					<?php 
						function getOtherProducts($brand,$product){
							$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
							$req=$pdo->prepare('SELECT * FROM products WHERE brand=? AND product_id!=? LIMIT 3');
							$req->execute(array($brand,$product));
							$data=$req->fetchAll(PDO::FETCH_OBJ);
							return $data;
						};

						$othersProducts=getOtherProducts($productBrand,$product->product_id);

						foreach($othersProducts as $otherProduct){
							echo '<div class="product_ad_item">';
							echo '<a href="product.php?id='.$otherProduct->product_id.'">';
							echo '<img class="product_ad_item-img" src="'.$otherProduct->product_img.'" alt="'.$otherProduct->name.'">';
							echo '<p class="product_ad_item-brand">'.$otherProduct->brand.'</p>';
							echo '<p class="product_ad_item-name">'.$otherProduct->name.'</p>';
							echo '<p class="product_ad_item-price">$'.$otherProduct->price.'</p></a></div>';
						}
					?>
				</div>
			</section>
<?php include 'footer.php'; ?>