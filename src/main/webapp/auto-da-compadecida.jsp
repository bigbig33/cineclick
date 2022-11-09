<%@page import="DTO.ClienteDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>CINECLICK</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="position-relative" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-secondary navbar-dark py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="index.jsp" class="navbar-brand">
                    <h1 href="" class="text-uppercase text-primary mb-1">CineClick</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="index.jsp#movies" class="nav-item nav-link">Movies</a>
                        <a href="index.jsp#soon" class="nav-item nav-link">Soon</a>
                        
                        <% 
							ClienteDTO objClienteDTO = (ClienteDTO) session.getAttribute("usuarioLogado");
							if(objClienteDTO != null){
								out.print("<a href=\"LogoutServlet\" class=\"nav-item nav-link\"><i class=\"fa fa-sign-out\"></i> Sign Out</a>");
							}else{
								out.print("<a href=\"LoginServlet\" class=\"nav-item nav-link\"><i class=\"fas fa-user-alt\"></i> Login</a>");
							}
						%>
						
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Detail Start -->
    <div class="container-fluid">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase mb-5">O Auto da Compadecida</h1>
            <div class="row align-items-center pb-2">
                <div class="col-lg-6 mb-4">
                    <img class="img-fluid" src="img/auto-da-compadecida.jpg" alt="" style="max-width: 250px;">
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="d-flex mb-3">
                        <h6 class="mr-2">Rating:</h6>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small>5.0</small>
                        </div>
                    </div>
                    <p>The adventures of the northeasterners João Grilo (Matheus Natchergaele), a poor and lying countryman, and Chicó (Selton Mello), the most coward of men. Both fight for their daily bread and go through several episodes deceiving everyone in the small village of Taperoá, in the hinterland of Paraíba. The salvation of the duo happens with the apparition of Our Lady (Fernanda Montenegro). Adaptation of the work of Ariano Suassuna.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Detail End -->


    <!-- Car Booking Start -->
    <div class="container-fluid pb-5">
        <div class="container">
            <div class="row">
            	<form method="POST" action="ComprarIngresso" class="row align-items-center col-lg-12">
	                <div class="col-lg-8">
	                    <div class="">
		                    	<div class="btn-group btn-group-toggle btn-session mb-4 d-block" data-toggle="buttons">
		                            <label class="btn btn-secondary active btn-lg mr-3">
		                              <input type="radio" name="dataFilme" id="optData1" value="10/12" checked>10 / 12
		                            </label>
		                            <label class="btn btn-secondary btn-lg mr-3">
		                              <input type="radio" name="dataFilme" id="optData2" value="11/12">11 / 12
		                            </label>
		                            <label class="btn btn-secondary btn-lg mr-3">
		                              <input type="radio" name="dataFilme" id="optData3" value="12/12">12 / 12
		                            </label>
		                        </div>
		                        
		                        <div class="btn-group btn-group-toggle btn-session mb-4 d-block" data-toggle="buttons">
		                            <label class="btn btn-secondary active btn-lg mr-3">
		                              <input type="radio" name="horaFilme" id="optHora1" value="19h30" checked> 19h30
		                            </label>
		                            <label class="btn btn-secondary btn-lg mr-3">
		                              <input type="radio" name="horaFilme" id="optHora2" value="20h30"> 20h30
		                            </label>
		                            <label class="btn btn-secondary btn-lg mr-3">
		                              <input type="radio" name="horaFilme" id="optHora3" value="21h30"> 21h30
		                            </label>
		                        </div>
		                        
		                        <div class="col-xs-12">
		                            <div class="row">
		                                <div class="form-group m-b-0 col-xs-8 col-md-10">
		                                    <span class="h5 d-block m-b-0">Whole Ticket CineClick</span>
		                                    <span class="">R$ 19,99</span>
		                                    <input name="precoInteiro" value="19.99" type="hidden">
		                                    <input name="nomeFilmeInteiro" value="O Auto da Compadecida" type="hidden">
		                                    <input name="tipoIngressoInteiro" value="Inteiro" type="hidden">
		                                </div>
		                    			
		                    			
		                    			
		                                <div class="frm-customselect">
		                                    <select class="form-control" name="qtdInteiro">
		                                        <option value="0" selected="selected" class="">Qtd</option>
		                                        <option label="1" value="1">1</option>
		                                        <option label="2" value="2">2</option>
		                                        <option label="3" value="3">3</option>
		                                    </select>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="col-xs-12">
		                            <div class="row">
		                                <div class="form-group m-b-0 col-xs-8 col-md-10">
		                                    <span class="h5 d-block m-b-0">Half Ticket CineClick</span>
		                                    <span class="">R$ 9,99</span>
		                                    <input name="precoMeia" value="9.99" type="hidden">
		                                    <input name="nomeFilmeMeia" value="O Auto da Compadecida" type="hidden">
		                                    <input name="tipoIngressoMeia" value="Meia" type="hidden">
		                                </div>
		                    			
		                    			
		                    			
		                                <div class="frm-customselect">
		                                    <select class="form-control" name="qtdMeia">
		                                        <option value="0" selected="selected" class="">Qtd</option>
		                                        <option label="1" value="1">1</option>
		                                        <option label="2" value="2">2</option>
		                                        <option label="3" value="3">3</option>
		                                    </select>
		                                </div>
		                            </div>
		                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="bg-secondary p-5 mb-5">
	                        <h2 class="text-primary mb-4">Payment</h2>
	                        <div class="form-group">
	                            <div class="custom-control custom-radio">
	                                <input type="radio" class="custom-control-input" name="tipoPagamento" id="paypal" value="Pix">
	                                <label class="custom-control-label" for="paypal">Pix</label>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="custom-control custom-radio">
	                                <input type="radio" class="custom-control-input" name="tipoPagamento" id="directcheck" value="Credito">
	                                <label class="custom-control-label" for="directcheck">Credit Card</label>
	                            </div>
	                        </div>
	                        <div class="form-group mb-4">
	                            <div class="custom-control custom-radio">
	                                <input type="radio" class="custom-control-input" name="tipoPagamento" id="banktransfer" value="Debito">
	                                <label class="custom-control-label" for="banktransfer">Debit Card</label>
	                            </div>
	                        </div>
	                        <button class="btn btn-block btn-primary py-3">Reserve Now</button>
	                    </div>
	                </div>
	        	</form>
            </div>
        </div>
    </div>
    <!-- Car Booking End -->



    <!-- Footer Start -->
    <div class="container-fluid bg-dark py-4 px-sm-3 px-md-5">
        <p class="mb-2 text-center text-body">&copy; <a href="#">CineClick</a>. All Rights Reserved.</p>
        <p class="m-0 text-center text-body">Designed by <a href="https://htmlcodex.com">HTML Codex</a></p>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>