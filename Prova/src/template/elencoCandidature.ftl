<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Candidature ricevute</title>

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

					<h1 class="text-center">CANDIDATURE RICEVUTE</h1>

				</div>
			</section>
					
			<div class="container">
				<#list offerte as offerta>
				<!-- Nav tabs -->
				<div class="mt-90 ml-60 mr-60"> 
					<ul class="nav nav-tabs nav-top-border" id="myTab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home${offerta.idOfferta}" role="tab" aria-controls="home" aria-selected="true">OFFERTA DI TIROCINIO</a>
						 </li>
						<li class="nav-item">
							<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile${offerta.idOfferta}" role="tab" aria-controls="profile" aria-selected="false">CANDIDATURE RICEVUTE</a>
						</li>
					</ul>

					<!-- Tab panes -->
					
					<div class="tab-content mt-10">
					
						<div class="tab-pane active" id="home${offerta.idOfferta}" role="tabpanel">			
							
							<div class="row d-flex justify-content-center">    					
								<div class="col-xs-8">
									<div class="card card-default ml-15 mr-15">
										<#if offerta.visibile == true>
											<div class="card-heading card-heading-transparent">
												<h2 class="card-title">${offerta.titolo}</h2>
											</div>
										</#if>
										<#if offerta.visibile == false>
											<div class="card-heading card-heading-transparent">
												<h2 class="card-title">${offerta.titolo} <span class="card-title text-danger">- Offerta Chiusa</span></h2>
											</div>
										</#if>
										<p class="sottotitolo">
											<span class="data">Pubblicato il ${offerta.dataPub}</span>
											<span class="emailResp">Email tutor aziendale: ${offerta.azienda.emailRespTirocinio}</span>
											<span class="durata">Durata tirocinio: ${offerta.mesi} mesi in ${offerta.ore} ore</span>
										</p>
										<#if offerta.visibile == true>
										<div class="card-block">
											<p>${offerta.descrizione}</p>
											<a class="btn btn-primary float-right" href="DettagliOfferta?idOfferta=${offerta.idOfferta}">DETTAGLI</a>
											<form method="post">
												<input type="hidden" name="offerta" value="${offerta.idOfferta}">
												<input type="hidden" name="nascondi" value="nascondi">
												<button type="submit" class="btn btn-danger float-right">CHIUDI OFFERTA</button>
											</form>
										</div>
										</#if>
										<#if offerta.visibile == false>
											<div class="card-block">
											<p>${offerta.descrizione}</p>
											<a class="btn btn-primary float-right" href="DettagliOfferta?idOfferta=${offerta.idOfferta}">DETTAGLI</a>
											</div>
										</#if>
									</div>				
								</div>
							</div>
							
						</div>
						
						<div class="tab-pane fade" id="profile${offerta.idOfferta}" role="tabpanel">
						<#if !(offerta.candidature[0]??)>	
							<div class="card card-default">
								<div class="card-block text-center">
									Non sono presenti candidature per questa offerta al momento.
								</div>
							</div>
						</#if>	
							<div class="form-inline">
							<#list offerta.candidature as candidatura>
								<div class="col-md-3">
									<div class="box-static box-border-top">
										<div class="box-title">
											<h4 class="text-center">${candidatura.utente.nome} ${candidatura.utente.cognome}</h4>
										</div>
										<p><b>Codice fiscale:</b> ${candidatura.utente.codiceFiscale}</p>
										<p><b>Telefono:</b> ${candidatura.utente.telefono}</p>
										<p><b>Data di nascita:</b> ${candidatura.utente.dataNascita}</p>
										<p><b>Luogo di nascita:</b> ${candidatura.utente.luogoNascita}</p>
										<p><b>Residenza:</b> ${candidatura.utente.residenza}</p>
										<p><b>Corso di laurea:</b> ${candidatura.utente.corsoLaurea}</p>
										<p><b>Email:</b> ${candidatura.utente.email}</p>
										<p><b>Numero CFU richiesti:</b> ${candidatura.cfu}</p>
										<div class="text-center">
										<form method="post">
											<input name="check" value="0" type="hidden">
											<input name="candidatura" value=${candidatura.idCandidatura} type="hidden">
											<button type="submit" class="btn btn-danger w-120"><i class="fa fa-close"></i> BOCCIA</button>
										</form>
										<form method="post">
											<input name="check" value="1" type="hidden">
											<input name="candidatura" value=${candidatura.idCandidatura} type="hidden">
											<button type="submit" class="btn btn-primary w-120 ml-10"><i class="fa fa-check"></i> APPROVA</button>
										</form>
										</div>
									</div>								
								</div>		
							</#list>				
							</div>
						</div>

					</div>
					
				</div>
				</#list>
			</div>
			
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
