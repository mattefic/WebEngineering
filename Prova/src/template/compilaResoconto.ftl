<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Compila resoconto</title>

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
			input[type=number]::-webkit-outer-spin-button,
			input[type=number]::-webkit-inner-spin-button {
			  -webkit-appearance: none;
			  margin: 0;
			}

			input[type=number] {
			  -moz-appearance:textfield;
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

					<h1 class="text-center">COMPILA RESOCONTO</h1>

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
									<h2 class="fs-20">Compila resoconto</h2>
								</div>

								<form class="m-0 sky-form" action="#" method="post">
									<fieldset>

										<div class="row">
											
											<div class="col-12">
												<label for="register:last_name">Numero ore tirocinio effettivamente svolte</label>
												<label class="input mb-10">
													<input required="" type="number" maxlength="30" name="ore">
													<b class="tooltip tooltip-bottom-right">Scrivete le ore effettivamente svolte dal tirocinante</b>
												</label>
											</div>
										</div>
										
										<div class="row">

											<div class="col-md-12 col-sm-12">
												<label for="register:last_name">Descrizione dettagliata dell'attività svolta dal tirocinante</label>
												<textarea required="" rows="5" class="form-control word-count" maxlength="500" data-info="textarea-words-info" name="descrizione"></textarea>

												<span class="fancy-hint fs-11 text-muted">
													<span class="float-right">
														Massimo <span id="textarea-words-info">500</span> caratteri
													</span>
												</span>

											</div>

										</div>
										
										<div class="row">

											<div class="col-md-12 col-sm-12">
												<label for="register:last_name">Giudizio finale sul tirocinante</label>
												<textarea name="giudizio" required="" rows="5" class="form-control word-count" maxlength="500" data-info="textarea-words-info"></textarea>

												<span class="fancy-hint fs-11 text-muted">
													<span class="float-right">
														Massimo <span id="textarea-words-info">500</span> caratteri
													</span>
												</span>

											</div>

										</div>
										
										<br>
										
										<div class="row justify-content-center">
										<div>
											<button type="submit" class="btn btn-primary">COMPILA</button>
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
