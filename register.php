<!--
//register.php
!-->

<?php

include('database_connection.php');

session_start();

$message = '';

if(isset($_SESSION['user_id']))
{
	header('location:index.php');
}

if(isset($_POST["register"]))
{
	$username = trim($_POST["username"]);
	$password = trim($_POST["password"]);
	$type = trim($_POST["type"]);
	$email = trim($_POST["email"]);
	$check_query = "
	SELECT * FROM login
	WHERE username = :username
	";
	$statement = $connect->prepare($check_query);
	$check_data = array(
		':username'		=>	$username
	);
	if($statement->execute($check_data))
	{
		if($statement->rowCount() > 0)
		{
			$message .= '<p><label>Nama telah terdaftar</label></p>';
		}
		else
		{
			if(empty($username))
			{
				$message .= '<p><label>Nama diperlukan</label></p>';
			}
			if(empty($email))
			{
				$message .= '<p><label>email diperlukan</label></p>';
			}
			else{
				if(!preg_match ('/^\S+@[\w\d.-]{2,}\.[\w]{2,6}$/iU', $email))
				{$message .= '<p><label>email salah</label></p>';}
				else{}
				}
			if(empty($password))
			{
				$message .= '<p><label>Password diperlukan</label></p>';
			}
			else
			{
				if($password != $_POST['confirm_password'])
				{
					$message .= '<p><label>Password tidak sama</label></p>';
				}
			}
			if(empty($type))
			{
				$message .= '<p><label>Tipe akun diperlukan</label></p>';}
			if($message == '')
			{
				$data = array(
					':username'		=>	$username,
					':password'		=>	password_hash($password, PASSWORD_DEFAULT),
					':status_akun'		=>	$type,
					':email'		=>	$email
				);

				$query = "
				INSERT INTO login
				(username, password, status_akun, email)
				VALUES (:username, :password, :status_akun, :email)
				";
				$statement = $connect->prepare($query);
				if($statement->execute($data))
				{
					$message = "<label>Registration Completed</label>";
				}
			}
		}
	}
}

?>

<html>
    <head>
        <title>BIZCHAT</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <div class="container">
			<br />

			<h3 align="center">BIZCHAT</a></h3><br />
			<br />
			<div class="panel panel-default">
  				<div class="panel-heading">Register</div>
				<div class="panel-body">
					<form method="post">
						<span class="text-danger"><?php echo $message; ?></span>
						<div class="form-group">
								<label>Nama</label>
								<input type="text" name="username" class="form-control" />
							</div>
							<div class="form-group">
								<label>Email</label>
								<input type="text" name="email" class="form-control" />
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" name="password" class="form-control" />
							</div>
							<div class="form-group">
								<label>Ulangi Password</label>
								<input type="password" name="confirm_password" class="form-control" />
							</div>
							<div class="form-group">

								<input type="radio" name="type" value="" checked hidden><label>Tipe akun</label><br>
							<input type="radio" name="type" value="penjual"> Penjual<br>
  						<input type="radio" name="type" value="pembeli"> Pembeli

							</div>
						<div class="form-group">
							<input type="submit" name="register" class="btn btn-info" value="Register" />
						</div>
						<div align="center">
							<a href="login.php">Login</a>
						</div>
					</form>
				</div>
			</div>
		</div>
    </body>
</html>