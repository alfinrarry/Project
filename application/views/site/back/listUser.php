<div class="container-fluid" data-codepage="<?= $codepage?>">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<div class="col-12" >
		<div class="row el-element-overlay" >	
		<?php foreach($role as $r):?>
		
		

		
			<div class="col-lg-3 col-md-3" >
			
				<div class="card" >
					<div class="el-card-item" float="right">
						<div class="el-card-avatar el-overlay-1"> 
							<img src="https://pasarmbois.com/assets/img/member/1.jpg"alt="user" />
							<div class="el-overlay">
								<ul class="list-style-none el-info">
									<li class="el-item">
										<a class="btn default btn-outline image-popup-vertical-fit el-link " href="<?php echo base_url('admin/User/editUser/'.$r['id'])?>" data-id="" data-dir="https://pasarmbois.com/Process/ban_member/">
										<i class="fas fa-pencil-alt"></i>
										</a>
									</li>
									<li class="el-item">
										<a class="btn default btn-outline el-link" href="<?php echo base_url('admin/User/del_user/'.$r['id'])?>">
										<i class="fas fa-trash-alt"></i>
										</a>
									</li>
								</ul>
							</div>	
							<div class="el-card-content">
								<h4 class="m-b-0"><?php echo $r['fullname']?></h4> 
								<span class="text-muted"><?php echo $r['name']?></span> <br>								
							</div>
						</div>
					</div>
				</div>
				
			</div>
			<?php endforeach ?>
		
		</div>
	</div>
</div>

			
			
	
	

