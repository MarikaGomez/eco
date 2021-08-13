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
		<header class="header">
			<div class="supNav">
				<div class="supNav_logo">
					<a href="index.php"><img src="img/logo.png" alt="logo"></a>
				</div>
				<div class="supNav_Right">
					<a href="login.php"><i class="far fa-user-circle"></i></a>
					<a href="cart.php"><i class="fas fa-shopping-bag"></i><span><?php if(isset($_SESSION['totalItems'])) echo $_SESSION['totalItems']; ?></span></a>				
				</div>
			</div>
		</header>
		
		<section>
			<div class="loginform_container">
				<img src="img/logo.png" alt="logo">
				<form id="loginForm" method="POST" action="#">
					<div class="username">
						<label for="username">Username</label>
						<input id="username" type="text" name="username" placeholder="Username">
					</div>
					<div class="password">
						<label for="password">Password</label>
						<input id="password" type="password" name="password" placeholder="Password"><br>
					</div>
					<div class="buttons">						
						<button class="button" id="connexion" type="submit" name="connexion">Connexion</button>
						<button class="button" id="newAccount">New Account</button>
					</div>
					<?php 
						function logIn($username,$password){
							$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
							$req=$pdo->prepare("SELECT * FROM users WHERE username=? limit 1");
							$req->execute(array($username));
							$data=$req->fetchAll(PDO::FETCH_ASSOC);
							
							if(count($data)==0){
								$_SESSION['logInError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Invalid username or password</p>';
							}else{
								$hashedPassword=$data[0]['password'];
								$checkPassword=password_verify($password,$hashedPassword);
								if($checkPassword){
									if($data[0]['status']==='admin'){
										$_SESSION['admin']='authorized';
									}
									$_SESSION["access"]="authorized";
									$_SESSION['id']=$data[0]['user_id'];
									$_SESSION['welcome']=$data[0]['username'].'<i class="far fa-user-circle" style="color:green;"></i>';
									header("location:index.php");				
								}else{
									$_SESSION['logInError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Invalid username or password</p>';
								}
							}		
						};
						if(isset($_POST['connexion'])){
							if(isset($_POST['username'])&& $_POST['username']!="" && isset($_POST['password'])&& $_POST['password']!=""){
								$username=htmlspecialchars($_POST['username']);
								$password=htmlspecialchars($_POST['password']);
								logIn($username,$password);
							}else{
								$_SESSION['logInError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot submit empty fields.</p>';
							}
						};
					?>
				</form>
				<?php 
					if(isset($_SESSION['logInError'])) echo $_SESSION['logInError']; 
					unset($_SESSION['logInError']);
				?>
				<form id='hidden' class="hidden" method="POST" action="#">
					<div class="username">
						<label for="hidden_username">Username</label>
						<input id="hidden_username" type="text" name="username" placeholder="Username">
					</div>
					<div class="password">
						<label for="hidden_password">Password</label>
						<input id="hidden_password" type="password" name="password" placeholder="Password" minlength="6">
						<label for="password2">Confirm Password</label>
						<input id="password2" type="password" name="password2" placeholder="Confirm Password" minlength="6">
					</div>
					<div class="name">
						<label for="name">Name</label>
						<input id="name" type="text" name="name" placeholder="Name">
					</div>
					<div class="firstname">
						<label for="firstname">Firstname</label>
						<input id="firstname" type="text" name="firstname" placeholder="Firstname">
					</div>
					<div class="email">
						<label for="email">Email</label>
						<input id="email" type="email" name="email" placeholder="Email">
					</div>
					<div class="address">
						<label for="address">Address</label>
						<input id="address" type="text" name="address" placeholder="Address">
					</div>
					<div class="phone">
						<label for="phone">Phone</label>
						<input id="phone" type="text" name="phone" placeholder="Phone"><br>
					</div>
					<div class="buttons">
						<button class="button" id="register" type="submit" name="register">Register</button>				
					</div>
					<?php
						function addNewMember($username,$password,$name,$firstname,$email,$address,$phone){
							$pdo=new PDO("mysql:host=localhost;dbname=eco",'root','');
							$req=$pdo->prepare("SELECT user_id FROM users WHERE username=? AND email=? limit 1");
							$req->execute(array($username,$email));
							$data=$req->fetchAll(PDO::FETCH_ASSOC);

							if(count($data)>0){
								$_SESSION['memberAlreadyExists']='<p style="font-weight: var(--fw-bold); color:#E94F37;">This username already exists.</p>';
							}else{
								$req=$pdo->prepare("INSERT INTO users(status,username,password,name,firstname,email,address,phone) VALUES (?,?,?,?,?,?,?,?)");
								$result=$req->execute(array('user',$username,password_hash($password,PASSWORD_DEFAULT),$name,$firstname,$email,$address,$phone));
								if($result){
									$_SESSION['addNewMember']='New Account created !';
									header('location:index.php');
								}
							}
						};

						if(isset($_POST['register'])){
							if(isset($_POST['username']) && $_POST['username']!=''){
								$username=htmlspecialchars($_POST['username']);
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}
							if(isset($_POST['password'])&& $_POST['password']!=''){
								if(isset($_POST['password2'])&& $_POST['password2']!=''){
									if($_POST['password']===$_POST['password2']){
										$password=htmlspecialchars($_POST['password']);
									}else{
										$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Password don\'t match.</p>';
									}
								}else{
									$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
								}
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}
							if(isset($_POST['name']) && $_POST['name']!=''){
								$name=htmlspecialchars($_POST['name']);
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}
							if(isset($_POST['firstname']) && $_POST['firstname']!=''){
								$firstname=htmlspecialchars($_POST['firstname']);
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}

							if(isset($_POST['email']) && $_POST['email']!=''){
								$email=htmlspecialchars($_POST['email']);
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}
							if(isset($_POST['address']) && $_POST['address']!=''){
								$address=htmlspecialchars($_POST['address']);
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}
							if(isset($_POST['phone']) && $_POST['phone']!=''){
								$phone=htmlspecialchars($_POST['phone']);
							}else{
								$_SESSION['updatError']='<p style="font-weight: var(--fw-bold); color:#E94F37;">Cannot leave empty fields.</p>';
							}
							addNewMember($username,$password,$name,$firstname,$email,$address,$phone);
						};
					?>
				</form>
			</div>
		</section>

<?php include 'footer.php';?>