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
			
			<?php
				if(isset($_SESSION['addNewMember'])){
					echo "<div class='newMember'>";
					echo $_SESSION['addNewMember'];
					echo "</div>";
					unset($_SESSION['addNewMember']);
				} 					
			?>

			<section class="banner">
				<h1 class="section_banner_title">eco. online store</h1>
				<h3 class="section_banner_subtitle">SKINCARE, HAIR AND BEAUTY PRODUCT</h3>
			</section>
			<section class="core">
				<h2 class="section_core_title section_core_title-mustHave">ALL PRODUCTS</h2>
				<div class="section_core_img-mustHave">
					<?php		
						function getProducts(){
							$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
							$req=$pdo->prepare('SELECT * FROM products ORDER BY name');
							$req->execute();
							$data=$req->fetchAll(PDO::FETCH_OBJ);
							return $data;
						};

						$products=getProducts();					
						
						foreach($products as $product){
							echo '<div class="mustHave_product">';
							echo '<a href="product.php?id='.$product->product_id.'">';
							echo '<img class="mustHave_product_img" src="'.$product->product_img.'" alt="'.$product->name.'">';
							echo '<p class="mustHave_product_brand">'.$product->brand.'</p>';
							echo '<p class="mustHave_product_name">'.$product->name.'</p>';
							echo '<p class="mustHave_product_price">$'.$product->price.'</p></a></div>';
						}
					?>
				</div>
			</section>				
<?php include 'footer.php'; ?>