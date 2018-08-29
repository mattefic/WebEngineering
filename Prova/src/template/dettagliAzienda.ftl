<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Dettagli azienda</title>

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

		<style>
		.checked {
			color: #8ab933;
		}
		</style>

		<!-- PAGE LEVEL SCRIPTS -->
		<link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />

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

					<h1 class="text-center">DETTAGLI AZIENDA</h1>

				</div>
			</section>
	
			<section>
				<div class="container">
					
					<div class="row">
						<!-- H4 -->
						<div class="col-4">
						</div>
						<div class="heading-title heading-border heading-color col-4" style="word-wrap: break-word;">
							<p><h5>RAGIONE SOCIALE:</h5>${azienda.ragioneSocialeNome}</p>
							<br>
							<p><h5>PARTITA IVA:</h5>${azienda.codiceFiscaleIva}</p>
							<br>
							<p><h5>INDIRIZZO SEDE LEGALE:</h5>${azienda.indirizzo}</p>
							<br>
							<p><h5>FORO COMPETENTE:</h5>${azienda.foro}</p>
							<br>
							<p><h5>LEGALE RAPPRESENTANTE:</h5>${azienda.nomeLegale} ${azienda.cognomeLegale}</p>
							<br>
							<p><h5>TUTOR AZIENDALE:</h5>${azienda.nomeRespTirocinio} ${azienda.cognomeRespTirocinio}</p>
							<br>
							<p><h5>TELEFONO TUTOR AZIENDALE:</h5>${azienda.telefonoRespTirocinio}</p>
							<br>
							<p><h5>EMAIL TUTOR AZIENDALE:</h5><a href="${azienda.emailRespTirocinio}">${azienda.emailRespTirocinio}</a></p>
							<br>
							<p><h5>CONVENZIONE:</h5><a href="#"><i class="fa fa-file-pdf-o" aria-hidden="true"></i></a></p>
							<br>
							<p><h5>VALUTAZIONE DEGLI UTENTI:</h5>
								<span class="fa fa-star <#if azienda.valutazione gte 1>checked</#if>"></span>
								<span class="fa fa-star <#if azienda.valutazione gte 2>checked</#if>"></span>
								<span class="fa fa-star <#if azienda.valutazione gte 3>checked</#if>"></span>
								<span class="fa fa-star <#if azienda.valutazione gte 4>checked</#if>"></span>
								<span class="fa fa-star <#if azienda.valutazione gte 5>checked</#if>"></span>
							</p>
						</div>
						<div class="col-4">
						</div>
					</div>
				</div>
			</section>
			<!-- / -->
			
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
								<li><a href="accedi.html">Accedi</a></li>
								<li><a href="registrazioneUtente.html">Registrati come utente</a></li>
								<li><a href="registrazioneAzienda.html">Registrati come azienda</a></li>
							</ul>
							<!-- /Links -->

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
		
			</div>
		<!-- /wrapper -->

</body>
</html>
