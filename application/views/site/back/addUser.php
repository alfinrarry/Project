<div class="container-fluid">
		<div class="row">
			<div class="col-12 card">
				<form action="https://pasarmbois.com/Process/addAdmin" method="POST">
					<div class="form-group checkUsername" data-url="https://pasarmbois.com/Login/username_check">
						<label for="">Username</label>
						<input type="text" id="checkUsername" class="form-control" name="username" id="username" placeholder="Username">
						<label id="username-invalid" style="display:none;" class="errorreg" for="username">Username yang anda
							masukkan sudah terdaftar</label>
						<label id="username-valid" style="display:none;" class="success" for="username">Username yang anda masukkan
							valid</label>
					</div>
					<div class="form-group">
						<label for="">Firstname</label>
						<input type="text" name="firstname" class="form-control" placeholder="Firstname">
					</div>
					<div class="form-group">
						<label for="">Lastname</label>
						<input type="text" name="lastname" class="form-control" placeholder="Lastname">
					</div>
					<div class="form-group checkEmail" data-url="https://pasarmbois.com/Login/checkEmail">
						<label for="">Email</label>
						<input id="checkEmail" type="email" class="form-control" name="email" required placeholder="Masukkan Email">
						<label id="format-invalid" style="display:none;" class="errorreg " for="alamat_email">Email yang anda
							masukkan tidak valid</label>
						<label id="alamat_email-invalid" style="display:none;" class="errorreg" for="alamat_email">Email yang anda
							masukkan sudah terdaftar</label>
						<label id="alamat_email-valid" style="display:none;" class="success" for="alamat_email">Email yang anda
							masukkan valid</label>
					</div>
					<div class="form-group">
						<label for="">Jabatan</label>
						<select name="id_role" class="form-control">
							<option value="4">Karyawan</option>
							<option value="5">Admin</option>
						</select>
					</div>
					<div class="form-group">
						<label for="">Password</label>
						<input type="password" name="password" class="form-control" placeholder="Password">
					</div>
                    <div class="form-group">
						<label for="">Gambar</label>
						<input type="file" name="image" class="form-control">
					</div>
					<div class="form-group text-right">
						<button class="btn btn-danger btn-sm waves-effect waves-light" type="submit" name="submit"><span
								class="btn-label"><i class="fas fa-save"></i></span> Simpan</button>
					</div>
				</form>
			</div>
			
