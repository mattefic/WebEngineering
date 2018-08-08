<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Offerte di tirocinio</title>
		<meta name="description" content="" />
		<meta name="Author" content="Dorin Grigoras [www.stepofweb.com]" />

		<!-- mobile settings -->
		<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

		<!-- WEB FONTS : use %7C instead of | (pipe) -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700" rel="stylesheet" type="text/css" />

		<!-- CORE CSS -->
		<style>
		<#include "assets/plugins/bootstrap/css/bootstrap.min.css">

		<!-- THEME CSS -->
		<#include "assets/css/essentials.css">
		<#include "assets/css/layout.css">
		<#include "assets/css/searchbar.css">
		<#include "assets/css/sottotitolo.css">

		<!-- PAGE LEVEL SCRIPTS -->
		<#include "assets/css/color_scheme/green.css">
		</style>
		
	</head>
	
	<body class="menu-vertical">
	<!-- wrapper -->
	<div id="wrapper">
		
	<!-- SIDE MENU -->
			<div id="mainMenu" class="sidebar-vertical">

				<a href="home.html" class="logo text-center">
					<img src="assets/images/_smarty/logo.png">
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
									<a href="home.html">
										HOME
									</a>
								</li>
								<li>
									<a href="accedi.html">
										ACCEDI
									</a>
								</li>
								<li>
									<a href="registrazioneUtente.html">
										REGISTRATI COME UTENTE
									</a>
								</li>
								<li>
									<a href="registrazioneAzienda.html">
										REGISTRATI COME AZIENDA
									</a>
								</li>
								<li>
									<a href="listaAziende.html">
										AZIENDE CONVENZIONATE
									</a>
								</li>
								<li>
									<a href="elencoOfferte.html">
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

					<h1 class="text-center">OFFERTE DI TIROCINIO</h1>

				</div>
			</section>
			
			<!-- SEARCH -->
					
			<div class="container">

				<div class="row d-flex justify-content-center mt-50">    					
					<div class="col-xs-8">
						
						<div class="mt-15 text-center ml-60 mr-60" style="display: flex;">
							<div id="listaAziende">Lista aziende</div>
							<div id="listaCit" class="ml-20">Lista città</div>
							<div id="mesiOre" class="ml-20">Mesi minimi</div>
							<div id="mesiOre" class="ml-20">Mesi massimi</div>
							<div id="mesiOre" class="ml-20">Ore minime</div>
							<div id="mesiOre" class="ml-20">Ore massime</div>
							<div id="cerc" class="ml-20">Cerca</div>
						</div>
						
						<div class="input-group ml-60 mr-60">
							<form autocomplete="off" action="#">
								<div id="listaAziende" class="autocomplete text-center mt-15">
									<div class="fancy-form fancy-form-select">
										<select class="form-control select2">
											<option value="">Azienda</option>
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
								<div id="listaCit" class="autocomplete text-center mt-15 ml-20">
									<div class="fancy-form fancy-form-select">
										<select class="form-control select2">
											<option value="">Città</option>
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
								<div class="form-inline">
									<input class="mesi mt-15 ml-20 text-center" type="number" min="0" max="12" placeholder="Mesi minimi">
									<input class="mesi mt-15 ml-20 text-center" type="number" min="0" max="12" placeholder="Mesi massimi">									
									<input class="ore mt-15 ml-20 text-center" type="number" min="0" max="999" placeholder="Ore minime">
									<input class="ore mt-15 ml-20 text-center" type="number" min="0" max="999" placeholder="Ore massime"> 
									<div id="cerc" class="autocomplete mt-15 ml-20">
										<input id="cerca" class="text-center" type="text" name="Cerca" placeholder="Cerca">
									</div>
									<div class="mt-15">
										<button id="buttonCerca" class="btn btn-default rounded-0" type="submit"><i class="fa fa-search fa-lg p-0"></i></button>
									</div>
								</div>
							</form>
						</div>

						<div class="card card-default mt-30 ml-60 mr-60">
							<div class="card-heading card-heading-transparent">
								<h2 class="card-title">${offerta.titolo}</h2>
							</div>
							<p class="sottotitolo">
								<span class="data">Pubblicato il ${offerta.dataPub}</span>
								<span class="emailResp">Email tutor aziendale: ${azienda.emailRespTirocinio}</span>
								<span class="durata">Durata tirocinio: ${offerta.mesi} mesi in ${offerta.ore} ore</span>
							</p>
							<div class="card-block">
								<p>${offerta.descrizione}</p>
								<button type="button" class="btn btn-primary mr-10 float-right">DETTAGLI</button>
							</div>
						</div>
						
					</div>
				</div>
				<br>
			</div>
			<!-- /SEARCH -->
			
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
			</footer>			
			<!-- /FOOTER -->

		<!-- JAVASCRIPT FILES -->
		<script>var plugin_path = 'assets/plugins/';</script>
		<script src="assets/plugins/jquery/jquery-3.3.1.min.js"></script>

		<script src="assets/js/scripts.js"></script>
	</div>
	<!-- /wrapper -->

</body>
</html>