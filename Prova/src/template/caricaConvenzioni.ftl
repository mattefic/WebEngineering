<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Carica convenzioni firmate</title>

		<!-- mobile settings -->
		<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

		<!-- WEB FONTS : use %7C instead of | (pipe) -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700" rel="stylesheet" type="text/css" />

		<!-- CORE CSS -->
		<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

		<!-- THEME CSS -->
		<link href="assets/css/essentials.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/layout.css" rel="stylesheet" type="text/css" />

		<!-- PAGE LEVEL SCRIPTS -->
		<link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />
		<style>
		.puntatore:hover{ 
			color: #8ab933; 
			cursor: pointer;
		}
		</style>

	</head>
	
	<body class="menu-vertical">
	<!-- wrapper -->
	<div id="wrapper">
		
	<!-- SIDE MENU -->
			<div id="mainMenu" class="sidebar-vertical">

				<a href="home.html" class="logo text-center">
					<img src="assets/images/_smarty/logo.png" alt="">
				</a>

				<div class="sidebar-nav">
					<div class="navbar navbar-default" role="navigation">

						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>

						<div class="navbar-collapse sidebar-navbar-collapse collapse" aria-expanded="false">

							<!-- MENU -->
							<#include menu>
							<!-- /MENU -->

						</div><!--/.nav-collapse -->

					</div>
				</div>

			</div>
			<!-- /SIDE MENU -->
			
			<section class="page-header page-header-xs">
				<div class="container">

					<h1 class="text-center">CARICA CONVENZIONI FIRMATE</h1>

				</div>
			</section>
			
			
			<div class="container" style="height: 70vh; min-height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;">	
				<div class="card card-danger mt-50 ml-200 mr-200">
					<div class="p-0 card-block text-center">
						<table class="table m-0">
							<thead>
								<tr>
									<th>RAGIONE SOCIALE</th>
									<th>CARICA CONVENZIONE FIRMATA</th>
								</tr>
							</thead>
							<tbody>
								<#list aziende as azienda>
								<form action="#" method="post" enctype="multipart/form-data">
									<tr>
										<td><a class="puntatore" href="dettagliAzienda.html">${azienda.ragioneSocialeNome}</a></td>
										<td>
											<div class="fancy-file-upload fancy-file-primary">
												<input type="file" class="form-control" name="convenzione" onchange="jQuery(this).next('input').val(this.value);" />
												<input type="text" class="form-control" placeholder="Nessun file selezionato" readonly="" />
												<input type="hidden" class="form-control" name="name" value="${azienda.idAzienda}" />
												<span class="button">CARICA</span>
											</div>
										</td>
										<td>
											<button type="submit" class="btn btn-primary mb-2">INVIA</button>
										</td>
									</tr>
								</form>
								</#list>								
							</tbody>
						</table>							
					</div>
				</div>
			</div>
			
			<!-- FOOTER -->
			<footer id="footer" class="mt-50">
				<div class="container">

					<div class="row justify-content-center">
						
						<div class="col-md-2 mt-20">
							<!-- Footer Logo -->
							<img class="footer-logo footer-2" src="assets/images/_smarty/logo-footer.png" alt="" />
						</div>

						<div class="col-md-2">
							<!-- Contact Address -->
							<address>
								<ul class="list-unstyled">
								<br>
									<li class="footer-sprite address">
										Via Vetoio, Coppito<br>
										64100 L'Aquila (AQ)<br>
									</li>
									<li class="footer-sprite phone">
										Telefono: +39 0862 433122
									</li>
									<li class="footer-sprite email">
										<a href="mailto:internshiptutor@univaq.it">internshiptutor@univaq.it</a>
									</li>
								</ul>
							</address>
							<!-- /Contact Address -->

						</div>
						
						<div class="col-md-2">

							<!-- Links -->
							<br>
							<h4 class="letter-spacing-1">NAVIGA SUL SITO</h4>
							<ul class="footer-links list-unstyled">
								<li><a href="home.html">Home</a></li>
								<li><a href="listaAziende.html">Aziende convenzionate</a></li>
								<li><a href="elencoOfferte.html">Offerte di tirocinio</a></li>
							</ul>
							<!-- /Links -->

						</div>
					
					</div>

				</div>

				<div class="copyright">
					<div class="container text-center">
						&copy; Tutti i diritti riservati, Internship Tutor
					</div>
				</div>
			</footer>			<!-- /FOOTER -->

		<!-- JAVASCRIPT FILES -->
		<script>var plugin_path = 'assets/plugins/';</script>
		<script src="assets/plugins/jquery/jquery-3.3.1.min.js"></script>

		<script src="assets/js/scripts.js"></script>
	</div>
	<!-- /wrapper -->

</body>
</html>
