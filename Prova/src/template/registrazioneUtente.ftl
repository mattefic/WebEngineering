<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Registrazione utente</title>
		<meta name="description" content="" />
		<meta name="Author" content="Dorin Grigoras [www.stepofweb.com]" />

		<!-- mobile settings -->
		<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

		<!-- WEB FONTS : use %7C instead of | (pipe) -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700" rel="stylesheet" type="text/css" />

			<!-- CORE CSS -->
		<style>
		<#include "../main/webapp/assets/plugins/bootstrap/css/bootstrap.min.css">

		<!-- THEME CSS -->
		<#include "../main/webapp/assets/css/essentials.css">
		<#include "../main/webapp/assets/css/layout.css">

		<!-- PAGE LEVEL SCRIPTS -->
		<#include "../main/webapp/assets/css/color_scheme/green.css">
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
		
			<section class="page-header page-header-xs">
				<div class="container">

					<h1 class="text-center">REGISTRATI COME UTENTE</h1>

				</div>
			</section>
	
			<section style="padding: 50px 0;">
				<div class="container">

					<div class="row">

						<div class="col-md-3 col-sm-5">
						</div>
					</div>
					
					<br>
					
					<div class="row">
					
						<div class="col-md-3 col-sm-5">
						</div>
						<!-- REGISTER -->
						<div class="col-md-6 col-sm-7">

							<div class="box-static box-transparent box-bordered p-30">

								<div class="box-title mb-30">
									<h2 class="fs-20">Registrati come utente</h2>
								</div>

								<form class="m-0 sky-form" action="#" method="post">
									<fieldset>

										<div class="row">

											<div class="col-md-6 col-sm-6">
												<label>Nome</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-user"></i>
													<input required="" type="text" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete il vostro nome</b>
												</label>
											</div>

											<div class="col-md-6 col-sm-6">
												<label for="register:last_name">Cognome</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-user"></i>
													<input required="" type="text" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete il vostro cognome</b>
												</label>
											</div>

										</div>

										<div class="row">

											<div class="col-md-6 col-sm-6">
												<label for="register:last_name">Codice fiscale</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-user"></i>
													<input name="CF" required="" type="text" maxlength="16">
													<b class="tooltip tooltip-bottom-right">Scrivete il vostro codice fiscale</b>
												</label>
											</div>

											<div class="col-md-6 col-sm-6">
												<label for="register:phone">Telefono</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-phone"></i>
													<input required="" type="tel" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete il vostro numero di telefono</b>
												</label>
											</div>

										</div>

										<div class="row">

											<div class="col-md-6 col-sm-6">
												<label for="register:pass1">Data di nascita</label>
												<label class="input mb-10">
													<input required="" type="date">
													<b class="tooltip tooltip-bottom-right">Inserite la vostra data di nascita</b>
												</label>
											</div>
											
											<div class="col-md-6 col-sm-6">
												<label for="register:last_name">Luogo di nascita</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-user"></i>
													<input required="" type="text" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete il vostro luogo di nascita</b>
												</label>
											</div>
										</div>
										
										<div class="row">

											<div class="col-md-6 col-sm-6">
												<label>Residenza</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-user"></i>
													<input required="" type="text" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete la vostra residenza</b>
												</label>
											</div>

											<div class="col-md-6 col-sm-6">
												<label for="register:last_name">Corso di laurea</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-user"></i>
													<input required="" type="text" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete il vostro corso di laurea</b>
												</label>
											</div>

										</div>
										
										<div class="row">
											<div class="col-md-12 col-sm-6">
												<label>Email</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-envelope"></i>
													<input required="" type="email" maxlength="60">
													<b class="tooltip tooltip-bottom-right">Scrivete la vostra email</b>
												</label>
											</div>
										</div>
										
										<div class="row">
										
											<div class="col-md-6 col-sm-6">
												<label for="register:pass2">Password</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-lock"></i>
													<input required="" type="password" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete la vostra password</b>
												</label>
											</div>
										
											<div class="col-md-6 col-sm-6">
												<label for="register:pass2">Ripeti password</label>
												<label class="input mb-10">
													<i class="ico-append fa fa-lock"></i>
													<input required="" type="password" maxlength="30">
													<b class="tooltip tooltip-bottom-right">Scrivete la vostra password di nuovo</b>
												</label>
											</div>
										</div>
										
										<br>
										
										<div class="row">
											<div class="col-sm-8">
												<label class="checkbox">
													<input type="checkbox" value="1">
													<i></i>Portatore di handicap
												</label>
											</div>
											<div>
												<button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> REGISTRATI</button>
											</div>
										</div>
										
										

									</fieldset>

								</form>
								
							</div>

						</div>
						<!-- /REGISTER -->
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
