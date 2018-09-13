<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Gestisci convenzioni</title>

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

					<h1 class="text-center">GESTISCI CONVENZIONI</h1>

				</div>
			</section>
			
			<!-- SEARCH -->
					
			<div class="container">
				<#list aziende as azienda>
				<div class="box-static box-border-top mt-50 ml-30 mr-30 p-30">

					<div class="box-title mb-30">
						<h2 class="fs-20">${azienda.ragioneSocialeNome}</h2>
					</div>
					
					<form class="m-0 sky-form" action="#" method="post">
						<fieldset>

							<div class="row">

								<div class="col-md-3 col-sm-3">
									<label>Ragione sociale</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.ragioneSocialeNome}" disabled>
									</label>
								</div>

								<div class="col-md-3 col-sm-3">
									<label for="register:last_name">Partita IVA</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="11" value="${azienda.codiceFiscaleIva}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete la vostra partita IVA</b>
									</label>
								</div>
											
								<div class="col-md-3 col-sm-3">
									<label for="register:last_name">Indirizzo sede legale</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.indirizzo}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete l'indirizzo della vostra sede legale</b>
									</label>
								</div>
											
								<div class="col-md-3 col-sm-3">
									<label for="register:last_name">Foro competente</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.foro}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete la città alla cui sede giudiziaria le parti dovranno rivolgersi in caso di disputa legale</b>
									</label>
								</div>
							</div>

							<div class="row">

								<div class="col-md-3 col-sm-3">
									<label>Nome legale rappresentante</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.nomeLegale}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete il nome del vostro legale rappresentante</b>
									</label>
								</div>
											
								<div class="col-md-3 col-sm-3">
									<label for="register:last_name">Cognome legale rappresentante</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.cognomeLegale}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete il cognome del vostro legale rappresentante</b>
									</label>
								</div>

								<div class="col-md-3 col-sm-3">
									<label>Nome responsabile convenzione tirocini</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.nomeRespTirocinio}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete il nome del vostro responsabile della convenzione per i tirocini</b>
									</label>
								</div>

								<div class="col-md-3 col-sm-3">
									<label for="register:last_name">Cognome responsabile convenzione tirocini</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-user"></i>
									<input required="" type="text" maxlength="30" value="${azienda.cognomeRespTirocinio}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete il cognome del vostro responsabile della convenzione per i tirocini</b>
									</label>
								</div>

							</div>
										
							<div class="row">

								<div class="col-md-6 col-sm-6">
									<label for="register:last_name">Email responsabile convenzione tirocini</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-envelope"></i>
									<input required="" type="email" maxlength="40" value="${azienda.emailRespTirocinio}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete l'email del vostro responsabile della convenzione per i tirocini</b>
									</label>
								</div>

								<div class="col-md-3 col-sm-3">
									<label for="register:phone">Telefono responsabile convenzione tirocini</label>
									<label class="input mb-10">
									<i class="ico-append fa fa-phone"></i>
									<input required="" type="tel" maxlength="30" value="${azienda.telefonoRespTirocinio}" disabled>
									<b class="tooltip tooltip-bottom-right">Scrivete il numero di telefono del vostro responsabile della convenzione per i tirocini</b>
									</label>
								</div>
								
											
								<div class="mt-30 col-md-3 col-sm-3">
									<form class="m-0 sky-form" action="#" method="post">
									<input  type="hidden" name="rifiuta" value=${azienda.idAzienda}>	
									<button type="submit" class="btn btn-danger float-right"><i class="fa fa-close"></i> RIFIUTA</button>
									</form>
									<form class="m-0 sky-form" action="#" method="post">
									<input  type="hidden" name="accetta" value=${azienda.idAzienda}>	
									<button type="submit" class="btn btn-primary float-right"><i class="fa fa-check"></i> ACCETTA</button>
									</form>
								</div>
							</div>
										
						</fieldset>					

					</form>
				</div>
				</#list>
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

	</div>
	<!-- /wrapper -->

</body>
</html>
