<?php 
include 'includes/head.php';
include 'db/koneksi.php';
error_reporting(0);
?>

<div id="login">
<div class="container">
	<div id="login-row" class="row justify-content-center align-items-center">
		<div id="login-column" class="col-md-6">
			<div class="login-box col-md-12">
				<form id="login-form" class="form" action="" method="post">
					<h3 class="text-center text-info">Login</h3>
					<div class="form-group">
						<label for="username" class="text-info">Username:</label><br>
						<input type="text" name="username" id="username" class="form-control">
					</div>
					<div class="form-group">
						<label for="password" class="text-info">Password:</label><br>
						<input type="password" name="password" id="password" class="form-control">
					</div>
					<div class="form-group">
						<label for="status" class="text-info">Status Pengguna</label><br>
						<select class="form-control" name="status">
							<option value="1">Administrator</option>
							<option value="2">User</option>
						</select>
					</div>
					<div class="form-group">
						<input type="submit" name="login" class="btn btn-info btn-md" value="login">
					</div>
				   
				</form>
			</div>
		</div>
	</div>
</div>
</div>
     <?php

     if(isset($_POST['login'])){
					require_once('db/koneksi.php'); //menyatakan sebuah file php yang lain
					// session_start();
					// session_destroy();
					$username	= $_POST['username'];
                    $password	= $_POST['password'];
                    $status = $_POST['status'];

                    $query = mysqli_query($koneksi, "SELECT * FROM user WHERE username='$username' AND password='$password'
					");
					
					
					if(mysqli_num_rows($query) == 0){ // Mengecek data apakah ada yang sama
						echo '<br>';
						echo '<div align="center" class="container">';
						echo '<div class="alert alert-danger">Maaf Login Gagal!</div>';
						echo '</div>';
					}else{
                        $row = mysqli_fetch_assoc($query); //untuk mengambil data yang sudah diseleksi
                        session_start(); //untuk memulai session  atau menganalisasi data dari session
						if($row['status'] == 'administrator' && $status == 1){ //mengambil data yang ada didalam row Status
                                $_SESSION['username']=$username;
								$_SESSION['status'] = 'administrator'; //ketika status nya benar admin akan masuk ke menu superadmin
								// $_SESSION['nama'] = $ambil['nama'];
								// $_SESSION['alamat'] = $ambil['alamat'];
                                echo '<script language="javascript">alert("Anda berhasil Login sebagai super admin!");
                                document.location="index.php?hal=admin/daftarbuku/list";</script>';
                        }else if($row['status'] == 'user' && $status == 2){
                                $_SESSION['username']=$username;
								$_SESSION['status']="user"; //ketika status nya benar user akan masuk ke menu user
								// $_SESSION['nama'] = $ambil['nama'];
								// $_SESSION['alamat'] = $ambil['alamat'];
                                echo '<script language="javascript">alert("Anda berhasil Login sebagai user!");
                                        document.location="index.php?hal=pinjaman";</script>';
						}else{
							echo '<br>';
                            echo '<div align="center" class="container">';
                            echo '<div class="alert alert-danger">Maaf Login Gagal!</div>';
                            echo '</div>';
						}
                    }
                }
?>
