<?php 
session_start();
unset($_SESSION['username']); //untuk menghapus konten alih-alih menghapus file secara permanen dari folder.
session_destroy(); //menghancurkan semua data yang berhubungan dengan session saat ini.

echo '<script language="Javascript"> alert("Berhasil Keluar Dong!!");
location.href="index.php";
</script>';
?>