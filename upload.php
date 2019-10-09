<html>
<head>
  <title>Form Pengisian Katalog</title>
</head>
<body>
  <h1>Form Pengisian Katalog</h1>
  <form method="post" enctype="multipart/form-data" action="upload.php">
		<label>Deskripsi</label>
		<br>
		<textarea rows="10" cols= "40" name="description" class="form-control">
		</textarea>
		<br>
		<br>
		<label>Kategori</label>
		<br>
		<select name="types">
    	<option value="baju_anak">Pakaian Anak-Anak</option>
    	<option value="hape">Handphone & Aksesoris</option>
  	</select>
		<br><br><br>
		<input type="file" name="gambar">
		<br><br><br>
    <input type="submit" name="upload" value="Upload">
  </form>
</body>
</html>

<?php

// Ambil Data yang Dikirim dari Form
		include 'koneksi.php';
		if($_POST['upload']){
			$ekstensi_diperbolehkan	= array('png','jpg');
			$nama = $_FILES['gambar']['name'];
			$x = explode('.', $nama);
			$ekstensi = strtolower(end($x));
			$ukuran	= $_FILES['gambar']['size'];
			$file_tmp = $_FILES['gambar']['tmp_name'];

			if(in_array($ekstensi, $ekstensi_diperbolehkan) === true){
				if($ukuran < 1044070){
					move_uploaded_file($file_tmp, 'images/'.$nama);
					$query = mysql_query("INSERT INTO upload VALUES(NULL, '$nama')");
					if($query){
						echo 'FILE BERHASIL DI UPLOAD';
					}else{
						echo 'GAGAL MENGUPLOAD GAMBAR';
					}
				}else{
					echo 'UKURAN FILE TERLALU BESAR';
				}
			}else{
				echo 'EKSTENSI FILE YANG DI UPLOAD TIDAK DI PERBOLEHKAN';
			}
		}
		?>

		<br/>
		<br/>
		<a href="index.php">Upload Lagi</a>
		<br/>
		<br/>

		<table>
			<?php
			include 'koneksi.php';
			$data = mysql_query("select * from katalog");
			while($d = mysql_fetch_array($data)){
			?>
			<tr>
				<td>
					<img src="<?php echo "images/".$d['nama_file']; ?>">
				</td>
			</tr>
			<?php } ?>
		</table>
