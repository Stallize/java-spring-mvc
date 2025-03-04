<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Stationery</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/style.css?version=51" rel="stylesheet">

            </head>


            <body>

                <!-- Spinner Start -->
                <div id="spinner"
                    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                    <div class="spinner-grow text-primary" role="status"></div>
                </div>
                <!-- Spinner End -->

                <jsp:include page="../layout/header.jsp" />

                <div class="container-fluid contact py-5">
                    <div class="container py-5">
                        <div class="p-5 bg-light rounded">
                            <div class="row g-4">
                                <div class="col-12">
                                    <div class="text-center mx-auto" style="max-width: 700px;">
                                        <h1 class="text-primary">Liên hệ</h1>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="h-100 rounded">
                                        <iframe class="rounded w-100" style="height: 400px;"
                                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.7366773976087!2d105.76154267560425!3d20.96308728066984!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454cabc683f57%3A0xdb02223a0620af21!2zxJDhuqFpIGjhu41jIE5ndXnhu4VuIFRyw6Np!5e0!3m2!1svi!2s!4v1740637197050!5m2!1svi!2s"
                                            loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="d-flex p-4 rounded mb-4 bg-white">
                                        <i class="fas fa-map-marker-alt fa-2x text-primary me-4"></i>
                                        <div>
                                            <h4>Địa chỉ</h4>
                                            <p class="mb-2">28A Đ. Lê Trọng Tấn, Hà Cầu, Hà Đông, Hà Nội 100000</p>
                                        </div>
                                    </div>
                                    <div class="d-flex p-4 rounded mb-4 bg-white">
                                        <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                        <div>
                                            <h4>Mail</h4>
                                            <p class="mb-2">daihocnguyentrai@gmail.com</p>
                                        </div>
                                    </div>
                                    <div class="d-flex p-4 rounded bg-white">
                                        <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                        <div>
                                            <h4>Số điện thoại</h4>
                                            <p class="mb-2">0981924302</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->



                <jsp:include page="../layout/footer.jsp" />







                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>