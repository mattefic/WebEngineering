<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8" />
		<title>Internship Tutor - Lista aziende convenzionate</title>
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
		<#include "assets/css/essentials.css">
		<#include "assets/css/layout.css">

		<!-- PAGE LEVEL SCRIPTS -->
		<#include "assets/css/header-1.css">
		<#include "assets/css/color_scheme/green.css">
		</style>

	</head>
	
	<body class="smoothscroll enable-animation menu-vertical">
	<!-- wrapper -->
	<div id="wrapper">
		
	<!-- SIDE MENU -->
			<div id="mainMenu" class="navbar-toggleable-md sidebar-vertical">

				<a href="index.html" class="logo text-center">
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
									<a href="home.html">
										HOME
									</a>
								</li>
								<li>
									<a href="loginRegistrazione.html">
										LOGIN / REGISTRAZIONE
									</a>
								</li>
								<li>
									<a href="listaAziende.html">
										LISTA AZIENDE
									</a>
								</li>
								<li>
									<a href="#">
										ELENCO OFFERTE
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

					<h1 class="text-center">LISTA AZIENDE CONVENZIONATE</h1>

				</div>
			</section>
			
			<div class="card card-danger mt-50 ml-40 mr-40">
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
							<td>${azienda.ragioneSocialeNome}</td>
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
			<div class="clearfix shop-list-options mb-20 mr-35">
				<ul class="pagination m-0 float-right">
					<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
				</ul>
			</div>
			
			<!-- FOOTER -->
			<footer id="footer">
				<div class="container">

					<div class="row">
						
						<div class="col-md-8">

							<!-- Footer Logo -->
							<img class="footer-logo footer-2" src="assets/images/_smarty/logo-footer.png" alt="" />

							<!-- Small Description -->
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas metus nulla, commodo a sodales sed, dignissim pretium nunc. Nam et lacus neque.</p>
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
