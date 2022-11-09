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
                        <a href="#movies" class="nav-item nav-link">Movies</a>
                        <a href="#soon" class="nav-item nav-link">Soon</a>
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


    <!-- Carousel Start -->
    <div class="container-fluid p-0" style="margin-bottom: 90px;">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="img/Spider-Man.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h4 class="text-white text-uppercase mb-md-3">Featured Movies</h4>
                            <h1 class="display-1 text-white mb-md-4">Spider-Man: No Way Home</h1>
                            <a href="spider-man.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Reserve Now</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/300.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h4 class="text-white text-uppercase mb-md-3">Featured Movies</h4>
                            <h1 class="display-1 text-white mb-md-4">300</h1>
                            <a href="300.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Reserve Now</a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="img/gente-grande.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-3" style="max-width: 900px;">
                            <h4 class="text-white text-uppercase mb-md-3">Featured Movies</h4>
                            <h1 class="display-1 text-white mb-md-4">Grown Ups</h1>
                            <a href="grown-ups.jsp" class="btn btn-primary py-md-3 px-md-5 mt-2">Reserve Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-prev-icon mb-n2"></span>
                </div>
            </a>
            <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                <div class="btn btn-dark" style="width: 45px; height: 45px;">
                    <span class="carousel-control-next-icon mb-n2"></span>
                </div>
            </a>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5">Welcome To <span class="text-primary">CineClick</span></h1>
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <img class="w-75 mb-4" src="img/banco-cinema.png" alt="">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-money-check-alt text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0">Secure Payment</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-secondary p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-film text-secondary"></i>
                        </div>
                        <h4 class="text-light text-uppercase m-0">Best Movies</h4>
                    </div>
                </div>
                <div class="col-lg-4 mb-2">
                    <div class="d-flex align-items-center bg-light p-4 mb-4" style="height: 150px;">
                        <div class="d-flex align-items-center justify-content-center flex-shrink-0 bg-primary ml-n4 mr-4" style="width: 100px; height: 100px;">
                            <i class="fa fa-2x fa-map-marker-alt text-secondary"></i>
                        </div>
                        <h4 class="text-uppercase m-0">Great Location</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->
    

    <!-- Services Start -->
    <div id="movies" class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-primary text-center">Movies</h1>
            <h1 class="display-3 text-uppercase text-center mb-5">On Display</h1>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center" style="width: 120px;">
                                <img class="w-75" src="img/thor.jpg" alt="">
                            </div>
                                <h1 class="display-2 text-white mt-n2 m-0">01</h1>
                        </div>
                        <a href="thor.jsp" class="text-decoration-none">
                            <h4 class="text-uppercase mb-3">Thor: Love and Thunder</h4>
                        </a>
                        <p class="m-0">Release Date: July 7, 2022</p>
                        <p class="m-0">Runtime: 1h 59min</p>
                        <p class="m-0">Genre: Action, Adventure, Fantasy</p>
                    </div>    
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center" style="width: 120px;">
                                <img class="w-75" src="img/top-gun.jpeg" alt="">
                            </div>
                                <h1 class="display-2 text-white mt-n2 m-0">02</h1>
                        </div>
                        <a href="top-gun.jsp" class="text-decoration-none">
                            <h4 class="text-uppercase mb-3">Top Gun: Maverick</h4>
                        </a>
                        <p class="m-0">Release Date: May 26, 2022</p>
                        <p class="m-0">Runtime: 2h 11min</p>
                        <p class="m-0">Genre: Action, Drama</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center" style="width: 120px;">
                                <img class="w-75" src="img/Spider-Man-cartaz.jpg" alt="">
                            </div>
                                <h1 class="display-2 text-white mt-n2 m-0">03</h1>
                        </div>
                        <a href="spider-man.jsp" class="text-decoration-none">
                            <h4 class="text-uppercase mb-3">Spider-Man: No Way Home</h4>
                        </a>
                        <p class="m-0">Release Date: December 16, 2021</p>
                        <p class="m-0">Runtime: 2h 37min</p>
                        <p class="m-0">Genre: Action, Adventure, Fantasy</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center" style="width: 120px;">
                                <img class="w-75" src="img/300-cartaz.jpg" alt="">
                            </div>
                                <h1 class="display-2 text-white mt-n2 m-0">04</h1>
                        </div>
                        <a href="300.jsp" class="text-decoration-none">
                            <h4 class="text-uppercase mb-3">300</h4>
                        </a>
                        <p class="m-0">Release Date: May 9, 2007</p>
                        <p class="m-0">Runtime: 1h 57min</p>
                        <p class="m-0">Genre: Action, War</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center" style="width: 120px;">
                                <img class="w-75" src="img/gente-grande-cartaz.jpg" alt="">
                            </div>
                                <h1 class="display-2 text-white mt-n2 m-0">05</h1>
                        </div>
                        <a href="grown-ups.jsp" class="text-decoration-none">
                            <h4 class="text-uppercase mb-3">Grown Ups</h4>
                        </a>
                        <p class="m-0">Release Date: September 24, 2010</p>
                        <p class="m-0">Runtime: 1h 42min</p>
                        <p class="m-0">Genre: Comedy</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="service-item d-flex flex-column justify-content-center px-4 mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div class="d-flex align-items-center justify-content-center" style="width: 120px;">
                                <img class="w-75" src="img/auto-da-compadecida.jpg" alt="">
                            </div>
                                <h1 class="display-2 text-white mt-n2 m-0">06</h1>
                        </div>
                        <a href="auto-da-compadecida.jsp" class="text-decoration-none">
                            <h4 class="text-uppercase mb-3">O Auto da Compadecida</h4>
                        </a>
                        <p class="m-0">Release Date: September 10, 2000</p>
                        <p class="m-0">Runtime: 1h 44min</p>
                        <p class="m-0">Genre: Comedy</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Services End -->


    <!-- Banner Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="bg-banner py-5 px-4 text-center">
                <div class="py-5">
                    <h1 class="display-1 text-uppercase text-primary mb-4">50% OFF</h1>
                    <h1 class="text-uppercase text-light mb-4">Special Offer For Students</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <!-- Team Start -->
    <div id="soon" class="container-fluid py-5">
        <div class="container py-5">
            <h1 class="display-4 text-primary text-center">Movies</h1>
            <h1 class="display-3 text-uppercase text-center mb-5">Coming Soon</h1>
            <div class="owl-carousel team-carousel position-relative" style="padding: 0 30px;">
                <div class="team-item">
                    <img class="img-fluid w-100" src="img/avatar.jpg" alt="">
                    <div class="position-relative py-4">
                        <h4 class="text-uppercase">Avatar 2: The Way of Water</h4>
                        <p class="m-0">16/12/2022</p>
                        <div class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="avatar.jsp"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
                    <img class="img-fluid w-100" src="img/pantera-negra.jpg" alt="">
                    <div class="position-relative py-4">
                        <h4 class="text-uppercase">Black Panther: Wakanda Forever</h4>
                        <p class="m-0">11/11/2022</p>
                        <div class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="black-panther.jsp"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
                    <img class="img-fluid w-100" src="img/puss-in-boots.jpg" alt="">
                    <div class="position-relative py-4">
                        <h4 class="text-uppercase">Puss in Boots: The Last Wish</h4>
                        <p class="m-0">21/12/2023</p>
                        <div class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="puss-in-boots.jsp"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="team-item">
                    <img class="img-fluid w-100" src="img/guardioes-galaxia.jpg" alt="">
                    <div class="position-relative py-4">
                        <h4 class="text-uppercase">Guardians of the Galaxy Vol. 3</h4>
                        <p class="m-0">05/05/2023</p>
                        <div class="team-social position-absolute w-100 h-100 d-flex align-items-center justify-content-center">
                            <a class="btn btn-lg btn-primary btn-lg-square mx-1" href="guardians-galaxy.jsp"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Banner Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row mx-0">
                <div class="col-lg-6 px-0">
                    <div class="px-5 bg-secondary d-flex align-items-center justify-content-between" style="height: 350px;">
                        <img class="img-fluid flex-shrink-0 ml-n5 w-50 mr-4" src="img/Popcorn.png" alt="">
                        <div class="text-right">
                            <h3 class="text-uppercase text-light mb-3">How about some popcorn?</h3>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 px-0">
                    <div class="px-5 bg-dark d-flex align-items-center justify-content-between" style="height: 350px;">
                        <div class="text-left">
                            <h3 class="text-uppercase text-light mb-3">How about some soda?</h3>
                        </div>
                        <img class="img-fluid flex-shrink-0 mr-n5 w-50 ml-4" src="img/bebida.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->


    <!-- Testimonial Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <h1 class="display-4 text-primary text-center">Feedback</h1>
            <h1 class="display-3 text-uppercase text-center mb-5">Our Client's Say</h1>
            <div class="owl-carousel testimonial-carousel">
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n4" src="img/testimonial-1.jpg" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Client Name</h4>
                    <i class="mb-2">Profession</i>
                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit sea sed</p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n4" src="img/testimonial-2.jpg" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Client Name</h4>
                    <i class="mb-2">Profession</i>
                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit sea sed</p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n4" src="img/testimonial-3.jpg" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Client Name</h4>
                    <i class="mb-2">Profession</i>
                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit sea sed</p>
                </div>
                <div class="testimonial-item d-flex flex-column justify-content-center px-4">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <img class="img-fluid ml-n4" src="img/testimonial-4.jpg" alt="">
                        <h1 class="display-2 text-white m-0 fa fa-quote-right"></h1>
                    </div>
                    <h4 class="text-uppercase mb-2">Client Name</h4>
                    <i class="mb-2">Profession</i>
                    <p class="m-0">Kasd dolor no lorem nonumy sit labore tempor at justo rebum rebum stet, justo elitr dolor amet sit sea sed</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


    


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