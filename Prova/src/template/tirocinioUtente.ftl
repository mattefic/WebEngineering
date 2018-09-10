<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Tirocinio</title>
		
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
			select {
				padding-top: 8px;
			}
			
			#recensisci {
				height: 45px;
				margin-bottom: 2px;
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

					<h1 class="text-center bold">TIROCINIO</h1>

				</div>
			</section>
	<#if mancante == false>
			<section>
				<div class="container" style="height: 40vh; min-height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;">
					
					<div class="row">
						<!-- H4 -->
						<div class="col-5">
						</div>
						
						<div class="heading-title heading-border heading-color col-4">
						<p> 								
							<a href="DettagliOfferta?idOfferta=${contratto.idOfferta}" class="btn btn-primary mt-20" role="button">DETTAGLI OFFERTA</a> 
							<a href="DettagliAzienda?idAzienda=${contratto.idAzienda}" class="btn btn-primary mt-20 ml-5" role="button">DETTAGLI AZIENDA</a> 							
						</p>
						<br>
						<br>
							<p class="bold">
								<a href="VisualizzaPdf?progetto=${contratto.idContratto}"><i class="ico-light ico-rounded ico-hover fa fa-file-pdf-o"></i></a> DOCUMENTAZIONE TIROCINIO.
							</p>
							<br>
							<br>
							<#if votato==false>
							<form method="post">
								<p>
								<h3> Vota l'azienda: </h3>
									<select name="voto">
										<option value="1"> 1 </option>
										<option value="2"> 2 </option>
										<option value="3"> 3 </option>
										<option value="4"> 4 </option>
										<option value="5"> 5 </option>
									</select>	
									<button type="submit" id="recensisci" class="btn btn-primary ml-20">VOTA</button>
								</p>
							</form>
							</#if>
						</div>
						<div class="col-4">
						</div>
					</div>
				</div>
			</section>
			<!-- / -->
			</#if>
			<#if mancante == true>
				<section>
					<h2>Non è presente alcun contratto a tuo carico</h2>
				</section>
			</#if>
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
