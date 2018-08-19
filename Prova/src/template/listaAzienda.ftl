<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Aziende convenzionate</title>

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
		<link href="assets/css/aziendeConvenzionate.css" rel="stylesheet" type="text/css" />

		<!-- PAGE LEVEL SCRIPTS -->
		<link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />
	</head>
	
	<body class="menu-vertical">
	<!-- wrapper -->
	<div id="wrapper">
		
	<!-- SIDE MENU -->
			<div id="mainMenu" class="sidebar-vertical">

				<a href="Home" class="logo text-center">
					<img src=${"assets/images/_smarty/logo.png"} alt="">
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
							<ul class="nav navbar-nav">
								<li>
									<a href="Home">
										HOME
									</a>
								</li>
								<li>
									<a href="Accedi">
										ACCEDI
									</a>
								</li>
								<li>
									<a href="RegistrazioneUtente">
										REGISTRATI COME UTENTE
									</a>
								</li>
								<li>
									<a href="RegistrazioneAzienda">
										REGISTRATI COME AZIENDA
									</a>
								</li>
								<li>
									<a href="ListaAziende">
										AZIENDE CONVENZIONATE
									</a>
								</li>
								<li>
									<a href="ElencoOfferte">
										OFFERTE DI TIROCINIO
									</a>
								</li>
							</ul>
							<!-- /MENU -->

						</div><!--/.nav-collapse -->

					</div>
				</div>

			</div>
			<!-- /SIDE MENU -->
			
			<section class="page-header page-header-xs">
				<div class="container">

					<h1 class="text-center">AZIENDE CONVENZIONATE</h1>

				</div>
			</section>
			
			<section id="corpo">
				<div class="ml-40 mr-40">
					<form autocomplete="off" action="#">
						<div id="ragFor" class="autocomplete text-center mt-15">
							<div class="fancy-form fancy-form-select">
								<select class="form-control select2">
									<option value="">Ragione sociale</option>
									<option value="1">Gallucci</option>
									<option value="2">Panificio di nonna</option>
									<option value="3">Azienda di papà</option>
									<option value="4">Bonifica</option>
									<option value="5">Salaria</option>
									<option value="6">Parmalat</option>
								</select>

								<!--
									.fancy-arrow
									.fancy-arrow-double
								-->
								<i class="fancy-arrow-double"></i>
							</div>
						</div>
						<div id="ragFor" class="autocomplete text-center mt-15 ml-20">
							<div class="fancy-form fancy-form-select">
								<select class="form-control select2">
									<option value="">Foro competente</option>
									<option value="1">Agrigento</option>
									<option value="2">Alessandria</option>
									<option value="3">Ancona</option>
									<option value="4">Aosta</option>
									<option value="5">L&rsquo;Aquila</option>
									<option value="6">Arezzo</option>
								</select>

								<!--
									.fancy-arrow
									.fancy-arrow-double
								-->
								<i class="fancy-arrow-double"></i>
							</div>
						</div>
						<button id="bottoneCerca" class="btn btn-default rounded-1 mt-15 ml-20" type="submit"><i class="fa fa-search fa-lg p-0"></i></button>
					</form>
				</div>
				
				<div class="card card-danger ml-40 mr-40 mt-50">
					<div class="p-0 card-block text-center">
						<table class="table m-0">
							<thead>
								<tr>
									<th>RAGIONE SOCIALE</th>
									<th>INDIRIZZO SEDE LEGALE</th>
									<th>PARTITA IVA</th>
									<th>ANAGRAFICA LEGALE RAPPRESENTANTE</th>
									<th>ANAGRAFICA RESPONSABILE TIROCINI</th>
									<th>TELEFONO RESPONSABILE TIROCINI</th>
									<th>EMAIL RESPONSABILE TIROCINI</th>
									<th>FORO COMPETENTE</th>
								</tr>
							</thead>
							<tbody>
							<#list aziende as azienda>
								<tr>
									<td><a class="puntatore" href="DettagliAzienda">${azienda.ragioneSocialeNome}</a></td>
									<td>${azienda.indirizzo}</td>
									<td>${azienda.codiceFiscaleIva}</td>
									<td>${azienda.nomeLegale} ${azienda.cognomeLegale}</td>
									<td>${azienda.nomeRespTirocinio} ${azienda.cognomeRespTirocinio}</td>
									<td>${azienda.telefonoRespTirocinio}</td>
									<td>${azienda.emailRespTirocinio}</td>
									<td>${azienda.foro}</td>
								</tr>
							</#list>
							</tbody>
						</table>							
					</div>
				</div>
				
				<div class="float-right mr-30">
				<!-- Pagination Default -->
				<ul class="pagination pagination-simple">
					<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
				</ul>
				</div>
			</section>
			
			<!-- FOOTER -->
			<footer id="footer">
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
							<h4 class="letter-spacing-1">ACCEDI O REGISTRATI</h4>
							<ul class="footer-links list-unstyled">
								<li><a href="Accedi">Accedi</a></li>
								<li><a href="RegistrazioneUtente">Registrati come utente</a></li>
								<li><a href="RegistrazioneAzienda">Registrati come azienda</a></li>
							</ul>
							<!-- /Links -->

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
