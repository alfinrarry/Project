<div class="container-fluid" data-codepage="<?= $codepage?>">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div class="col-md-3 offset-md-9 text-right">
					<a href="./addSlider">
					<button class="btn btn-primary waves-effect waves-light mb-3" type="button"><span class="btn-label"
								data-toggle="modal" >+ Tambah Slider</button>
								</a>
						
					</div>
					<div class="table-responsive">
						<table id="listSlider" class="table table-striped" style="width:100%">
							<thead>
								<tr>
									<th width="80%">Judul</th>
									<th>Aksi</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										Pasar Mbois </td>
									<td>
										<button class="btn btn-info btn-sm waves-effect waves-light detail-slider" data-toggle="modal"
											data-target="#editSlider" type="button" data-id="7" data-domain="https://pasarmbois.com/assets/"
											data-url="https://pasarmbois.com/Process/getSliderByid/"><span class="btn-label"><i
													class="far fa-edit"></i></span>
											Edit</button>
										<button class="btn btn-danger btn-sm waves-effect waves-light del_slider" data-id="7"
											data-dir=https://pasarmbois.com/Process/del_slider/ type="button"><span class="btn-label"><i
													class="fa as fas fa-trash"></i></span></button>
									</td>
                </tr>
                
								</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End Container fluid  -->
