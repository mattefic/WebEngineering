<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Visualizza statistiche</title>

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
		<link href="assets/css/sottotitolo.css" rel="stylesheet" type="text/css" />

		<!-- PAGE LEVEL SCRIPTS -->
		<link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />
		<style>
		.puntatore:hover{ 
			color: #8ab933; 
			cursor: pointer;
		}
		.checked {
			color: #8ab933;
		}
		</style>

	</head>
	
	<body class="menu-vertical">
	<!-- wrapper -->
	<div id="wrapper">
		
	<!-- SIDE MENU -->
			<div id="mainMenu" class="sidebar-vertical">

				<a href="Home" class="logo text-center">
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

					<h1 class="text-center">VISUALIZZA STATISTICHE</h1>

				</div>
			</section>
			
			<!-- SEARCH -->
					
			<div class="container">
				
				<!-- Nav tabs -->
				<div class="mt-90 ml-60 mr-60"> 
					<ul class="nav nav-tabs nav-top-border" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">TUTOR PI&Ugrave; RICHIESTI</a>
						 </li>
						<li class="nav-item">
							<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">AZIENDE CON PI&Ugrave; TIROCINANTI</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="rating-tab" data-toggle="tab" href="#rating" role="tab" aria-controls="rating" aria-selected="false">AZIENDE CON VALUTAZIONI MIGLIORI</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content mt-10">
						<div class="tab-pane active" id="home" role="tabpanel">		
							<div class="card card-danger">
								<div class="p-0 card-block text-center">
									<table class="table m-0">
										<thead>
											<tr>
												<th>NOME</th>
												<th>COGNOME</th>
												<th>EMAIL</th>
												<th>NUMERO RICHIESTE</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Giuseppe</td>
												<td>Della Penna</td>
												<td>GiuseppeDellaPenna@univaq.it</td>
												<td>100000000^597</td>
											</tr>
											<#list tutori as tutore>
											<tr>
												<td>${tutore.nome}</td>
												<td>${tutore.cognome}</td>
												<td>${tutore.email}</td>
												<td>${tutore.numRichieste}</td>
											</tr>
											</#list>
										</tbody>
									</table>							
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="profile" role="tabpanel">
							<div class="card card-danger">
								<div class="p-0 card-block text-center">
									<table class="table m-0">
										<thead>
											<tr>
												<th>RAGIONE SOCIALE</th>
												<th>NUMERO TIROCINANTI</th>
											</tr>
										</thead>
										<tbody>
											<#list aziendeTirocinanti as azienda>
											<tr>
												<td><a class="puntatore" href="DettagliAzienda?idAzienda=${azienda.idAzienda}">${azienda.ragioneSocialeNome}</a></td>
												<td>${azienda.numTirocinanti}</td>
											</tr>
											</#list>
											
										</tbody>
									</table>							
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="rating" role="tabpanel">
							<div class="card card-danger">
								<div class="p-0 card-block text-center">
									<table class="table m-0">
										<thead>
											<tr>
												<th>RAGIONE SOCIALE</th>
												<th>VALUTAZIONE DEGLI UTENTI</th>
											</tr>
										</thead>
										<tbody>
											<#list aziende as azienda>
											<tr>
												<td><a class="puntatore" href="DettagliAzienda?idAzienda=${azienda.idAzienda}">${azienda.ragioneSocialeNome}</a></td>
												<td>
													<span class="fa fa-star <#if azienda.valutazione gte 1>checked</#if>"></span>
													<span class="fa fa-star <#if azienda.valutazione gte 2>checked</#if>"></span>
													<span class="fa fa-star <#if azienda.valutazione gte 3>checked</#if>"></span>
													<span class="fa fa-star <#if azienda.valutazione gte 4>checked</#if>"></span>
													<span class="fa fa-star <#if azienda.valutazione gte 5>checked</#if>"></span>
												</td>
											</tr>
											</#list>
										</tbody>
									</table>							
								</div>
							</div>
						</div>
					</div>
				</div>
					
				<br>
				
			</div>
			<!-- /SEARCH -->
			
			<!-- FOOTER -->
			<footer id="footer" class="mt-30">
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
								<li><a href="Home">Home</a></li>
								<li><a href="ListaAziende">Aziende convenzionate</a></li>
								<li><a href="ElencoOfferte">Offerte di tirocinio</a></li>
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
