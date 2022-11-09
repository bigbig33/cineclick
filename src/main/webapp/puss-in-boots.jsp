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
            <h1 class="display-4 text-uppercase mb-5">Puss in Boots: The Last Wish</h1>
            <div class="row align-items-center pb-2">
                <div class="col-lg-6 mb-4">
                    <img class="img-fluid" src="img/puss-in-boots.jpg" alt="" style="max-width: 300px;">
                </div>
                <div class="col-lg-6 mb-4">
                    <div class="d-flex">
                        <h6 class="mr-2">Release Date:</h6>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <p class="m-0">December 21, 2022</p>
                        </div>
                    </div>
                    <div class="d-flex">
                        <h6 class="mr-2">Runtime:</h6>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <p class="m-0">0min</p>
                        </div>
                    </div>
                    <div class="d-flex mb-5">
                        <h6 class="mr-2">Genre:</h6>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <p class="m-0">Animation</p>
                        </div>
                    </div>
                    <p>Puss in Boots discovers that his passion for adventure has taken its toll: he has burned through eight of his nine lives. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Detail End -->



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