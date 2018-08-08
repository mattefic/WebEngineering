<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Home</title>
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
			
			<section>
				
				<ul class="process-steps nav nav-tabs nav-justified text-left">
					<li class="nav-item">
						<a class="nav-link active" href="#step1" data-toggle="tab">1</a>
						<h4>Cos'è un tirocinio</h4>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#step2" data-toggle="tab">2</a>
						<h4>Registrarsi come utente</h4>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#step3" data-toggle="tab">3</a>
						<h4>Registrarsi come azienda</h4>
					</li>
				</ul>

				<div class="tab-content mt-60 ml-200 mr-200">
					<div role="tabpanel" class="tab-pane active" id="step1">
						<h4>Cos'è un tirocinio</h4>
						Lo stage, o tirocinio formativo e di orientamento nella terminologia di legge, è un periodo di formazione "on the job" presso un'azienda e costituisce un'occasione di conoscenza diretta del mondo del lavoro oltre che di acquisizione di una specifica professionalità. Il tirocinante, durante il periodo di stage, sarà assistito da un responsabile di designazione aziendale (tutor aziendale) che lo seguirà nelle sue attività al quale verrà affiancata la figura di un responsabile didattico nominato dall'università (tutor universitario). Al termine del tirocinio lo studente avrà la possibilità di votare per l'azienda esprimendo una valutazione di gradimento.
					</div>

					<div role="tabpanel" class="tab-pane" id="step2">
						<h4>Registrarsi come utente</h4>
						Gli studenti potranno aderire, registrandosi come utenti, alle offerte di tirocinio proposte dalle aziende convenzionate fornendo i propri dati personali e specificando il numero di crediti richiesti unitamente ai nomi e alle email dei tutori prescelti. Il sistema provvederà a inviare una email di richiesta ai referenti per i tirocini delle aziende e una ai tutori designati, contenenti entrambe gli estremi dell'offerta e i dati forniti in fase di registrazione. In seguito a una fase di contrattazione esterna al nostro sito, durante la quale gli studenti potranno discutere con le aziende dei dettagli del tirocinio, esse avranno la possibilità di bocciare o approvare le candidature.  
					</div>

					<div role="tabpanel" class="tab-pane" id="step3">
						<h4>Registrarsi come azienda</h4>
						Le aziende potranno, registrandosi come aziende e previa autorizzazione del sistema, convenzionarsi e pubblicare le proprie offerte di tirocinio. Un pannello riepilogativo delle proposte pubblicate sarà messo loro a disposizione così come la possibilità di visualizzare, approvare e bocciare le candidature degli utenti ricevute per ciascun avviso. Nel caso in cui le candidature saranno accettate le aziende dovranno comunicare al sistema il periodo di effettuazione del tirocinio e, al termine dello stesso, compilare un resoconto fornendo le ore di tirocinio effettivamente svolte, la descrizione dettagliata dell'attività e un giudizio finale.
					</div>
				</div>
			
				<div class="cart-visual cart-visual-success mt-100 ml-200">

					<svg id="cart-visual-svg-2" class="" height="0" width="100%" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1133.338 144.499" style="height: 195px;" xml:space="preserve">
						<path d="M948.868,144.499H0V72.249c26.67-9.407,66.707-19.582,119.535-19.582c133.999,0,227.999,39.333,332.665,39.333c80,0,142.667-36.666,174.667-52.666S716.201,0,804.201,0s144.667,20,144.667,20c44.173,10.997,122.713,47.543,184.47,78.215v46.284H948.868z"></path>
					</svg>

					<div class="container">

						<div class="row">

							<div class="col-6 col-md-3 mt--30 pb-150">
								<div class="cart-visual-pin"><div class="cart-visual-pin-ball"> </div></div>
								<div class="pl-20 pr-20">
									<h2><i class="countTo" data-speed="2000">1000</i>+</h2>
									<p class="fw--300">Aziende convenzionate</p>
									<a href="listaAziende.html" class="marker-more">Guarda +</a>
								</div>
							</div>

							<div class="col-6 col-md-3 mt-80 pb-120">
								<div class="cart-visual-pin"><div class="cart-visual-pin-ball"> </div></div>
								<div class="pl-20 pr-20">
									<h2><i class="countTo" data-speed="2000">4000</i>+</h2>
									<p class="fw--300">Studenti universitari registrati</p>
								</div>
							</div>

							<div class="col-6 col-md-3 mt-60">
								<div class="cart-visual-pin"><div class="cart-visual-pin-ball"> </div></div>
								<div class="pl-20 pr-20">
									<h2><i class="countTo" data-speed="2000">60</i>%</h2>
									<p class="fw--300">Assunti a fine tirocinio</p>
								</div>
							</div>

							<div class="col-6 col-md-3 mt-0">
								<div class="cart-visual-pin"><div class="cart-visual-pin-ball"> </div></div>
								<div class="pl-20 pr-20">
									<h2><i class="countTo" data-speed="2000">1200</i>+</h2>
									<p class="fw--300">Offerte di tirocinio</p>
									<a href="elencoOfferte.html" class="marker-more">Guarda +</a>
								</div>
							</div>

						</div>

					</div>

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
		
		<!-- JAVASCRIPT FILES -->
		<script>var plugin_path = 'assets/plugins/';</script>
		<script src="assets/plugins/jquery/jquery-3.3.1.min.js"></script>

		<script src="assets/js/scripts.js"></script>
</body>
</html>
