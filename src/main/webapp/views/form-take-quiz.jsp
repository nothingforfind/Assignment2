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
                    <% if (session.getAttribute("user") != null) { %>
                    <div class="col-md-2"><a href="http://localhost:8080/signout">Sign out</a></div>
                    <div class="col-md-1"></div>
                    <% } else { %>
                    <div class="col-md-3"></div>
                    <% } %>
                </div>
            </nav>
        </header>
    </div>

    <div class="container-fluid col-10">
        <content>
            <!-- Login Form -->
            <form action="doing-quiz">
                <div class="row text-center">
                    <div class="col-md-4"></div>
                    <div class="col-md-3">
                        <h3>Welcome, ${sessionScope.user.userId}</h3>
                    </div>
                    <div class="col-md-5"></div>
                </div>

                <!-- Label -->
                <div class="row mt-3">
                    <div class="col-md-3"></div>
                    <div class="col-md-2">Enter number of questions:</div>
                    <div class="col-md-7"></div>
                </div>

                <!-- Input -->
                <div class="row mt-2">
                    <div class="col-md-4"></div>
                    <div class="col-md-3 text-center">
                        <input type="text" name="quizQuantity">
                    </div>
                    <div class="col-md-5"></div>
                </div>

                <!-- Button -->
                <div class="row mt-4">
                    <div class="col-md-5"></div>
                    <div class="col-md-2">
                        <input type="submit" value="Start Quiz">
                    </div>
                    <div class="col-md-5"></div>
                </div>
            </form>
        </content>
    </div>
</div>
</body>

</html>