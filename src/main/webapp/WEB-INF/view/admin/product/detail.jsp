<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Thông tin sản phẩm - Laptopshop</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <script>
                    //jquery , neu web load thi chay code, lay id input avatarFile ,them event onChange,chay vao function lay ra duong link url web api de hien thi anh
                    //,jquery them attr src , chinh css
                    $(document).ready(() => {
                        const productFile = $("#productFile");
                        productFile.change(function (e) {
                            const imgURL = URL.findcreateObjectURL(e.target.files[0]);
                            $("#productImagePreview").attr("src", imgURL);
                            $("#productImagePreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Dashboard</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>Product ${id} Detail </h3>
                                        </div>
                                        <hr />
                                        <div class="card" style="width: 60%">
                                            <div class="card-header">
                                                Product Information
                                            </div>
                                            <ul class="list-group list-group-flush">

                                                <li class="list-group-item"><img
                                                        src="/images/product/${productDetail.image}" height="200"
                                                        width="200"></li>
                                                <li class="list-group-item">ID:${productDetail.id}</li>
                                                <li class="list-group-item">Name:${productDetail.name}</li>
                                                <li class="list-group-item">Price:${productDetail.price}</li>
                                            </ul>
                                        </div>

                                        <a href="/admin/product" class="btn btn-primary">Back</a>


                                    </div>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>