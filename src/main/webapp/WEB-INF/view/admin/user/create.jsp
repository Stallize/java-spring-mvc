<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        </head>

        <body>
            <div class="container h-100 ">
                <div class="row h-100 justify-content-center align-items-center">
                    <form class="col-6">
                        <h1 class="border-bottom">Create a user</h1>
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                aria-describedby="emailHelp">
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPhonenumber1" class="form-label">Phone Number</label>
                            <input type="phone" class="form-control" id="exampleInputPhonenumber1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputFullname1" class="form-label">Fullname</label>
                            <input type="fullName" class="form-control" id="exampleInputFullname">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputAddress1" class="form-label">Address</label>
                            <input type="address" class="form-control" id="exampleInputAddress1">
                        </div>
                        <button type="create" class="btn btn-primary">Create</button>
                    </form>
                </div>
            </div>
        </body>

        </html>