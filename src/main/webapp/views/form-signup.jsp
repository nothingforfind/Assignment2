<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link href="https://drive.google.com/uc?id=1ubTSoQluP3JV0L6ipDRcnDrc5NrF3J-h" rel="stylesheet" type="text/css"/>
    <title>Online Quiz</title>
</head>

<body>
<div class="container-fluid col-11">
    <div class="container-fluid col-11">
        <header>
            <!-- Menu -->
            <nav class="pt-3 pb-3 mt-3 mb-5 text-center nav-menu">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-2"><a href="http://localhost:8080/signin">Home</a></div>
                    <div class="col-md-2"><a href="http://localhost:8080/take-quiz">Take Quiz</a></div>
                    <div class="col-md-2"><a href="http://localhost:8080/make-quiz">Make Quiz</a></div>
                    <div class="col-md-2"><a href="http://localhost:8080/manage-quiz">Manage Quiz</a></div>
                    <div class="col-md-3"></div>
                </div>
            </nav>
        </header>
    </div>

    <div class="container-fluid col-10">
        <form action="/filled-form" method="post">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4 text-center">
                    <h2>Registrator Form</h2>
                </div>
                <div class="col-md-4"></div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4"></div>
                <div class="col-md-1">Username:</div>
                <div class="col-md-2">
                    <input type="text" name="username">
                </div>
                <div class="col-md-5"></div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4"></div>
                <div class="col-md-1">Password:</div>
                <div class="col-md-2">
                    <input type="password" name="password">
                </div>
                <div class="col-md-5"></div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4"></div>
                <div class="col-md-1">Role:</div>
                <div class="col-md-2">
                    <select name="role">
                        <option value="teacher">Teacher</option>
                        <option value="user">User</option>
                    </select>
                </div>
                <div class="col-md-5"></div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4"></div>
                <div class="col-md-1">Email:</div>
                <div class="col-md-2">
                    <input type="text" name="email">
                </div>
                <div class="col-md-5"></div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4"></div>
                <div class="col-md-4 text-center">
                    <input type="submit" value="Submit">
                </div>
                <div class="col-md-4"></div>
            </div>
        </form>

        <% if (request.getAttribute("error") != null) { %>
        <script>
            var errorMessage = '<%= request.getAttribute("error") %>';
            alert(errorMessage);
        </script>
        <% } %>
    </div>
    <div/>
</body>

</html>