<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Offerte di tirocinio</title>

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
		<link href="assets/css/searchbar.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/sottotitolo.css" rel="stylesheet" type="text/css" />

		<!-- PAGE LEVEL SCRIPTS -->
		<link href="assets/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />

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
										<select name="azienda" class="form-control select2">
											<option value="">Azienda</option>
											<#list aziende as azienda>
												<option value="${azienda}">${azienda}</option>
											</#list>
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
										<select name="luogo" class="form-control select2">
											<option value="">Città</option>
												<#list luoghi as luogo>
											<option value="${luogo}">${luogo}</option>
											</#list>
										</select>

										<!--
											.fancy-arrow
											.fancy-arrow-double
										-->
										<i class="fancy-arrow-double"></i>
									</div>
								</div>
								<div class="form-inline">
									<input name="mesimin" class="mesi mt-15 ml-20 text-center" type="number" min="0" max="12" placeholder="Mesi minimi">
									<input name="mesimax" class="mesi mt-15 ml-20 text-center" type="number" min="0" max="12" placeholder="Mesi massimi">									
									<input name="oremin" class="ore mt-15 ml-20 text-center" type="number" min="0" max="999" placeholder="Ore minime">
									<input name="oremax" class="ore mt-15 ml-20 text-center" type="number" min="0" max="999" placeholder="Ore massime"> 
									<div id="cerc" class="autocomplete mt-15 ml-20">
										<input id="cerca" class="text-center" type="text" name="cerca" placeholder="Cerca">
									</div>
									<div class="mt-15">
										<button id="buttonCerca" class="btn btn-default rounded-0" type="submit"><i class="fa fa-search fa-lg p-0"></i></button>
									</div>
								</div>
							</form>
						</div>
					
						
						<#list offerteTrovate as offerta>
						<div class="card card-default mt-30 ml-60 mr-60">
							<div class="card-heading card-heading-transparent">
								<h2 class="card-title">${offerta.titolo} - ${offerta.azienda.ragioneSocialeNome}</h2>
							</div>
							<p class="sottotitolo">
								<span class="data">Pubblicato il ${offerta.dataPub}</span>
								<span class="emailResp">Email tutor aziendale: <a href="mailto:${offerta.azienda.emailRespTirocinio}">${offerta.azienda.emailRespTirocinio}</a></span>
								<span class="durata">Durata tirocinio: ${offerta.mesi} mesi in ${offerta.ore} ore</span>
							</p>
							<div class="card-block">
								<p>${offerta.descrizione}</p>
								<a href="DettagliOfferta?idOfferta=${offerta.idOfferta}" class="btn btn-primary mr-10 float-right">DETTAGLI</a>
							</div>
						</div>
						</#list>
						
					
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
