<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://drive.google.com/uc?id=1ubTSoQluP3JV0L6ipDRcnDrc5NrF3J-h" rel="stylesheet" type="text/css"/>
    <title>Online Quiz</title>
</head>

<body>
<div class="container-fluid col-11">
    <header>
        <!-- Menu -->
        <nav class="pt-3 pb-3 mt-3 mb-5 text-center nav-menu">
            <div class="row">
                <div class="col-md-2"><a href="http://localhost:8080/signin">Home</a></div>
                <div class="col-md-2"><a href="http://localhost:8080/take-quiz">Take Quiz</a></div>
                <div class="col-md-2"><a href="http://localhost:8080/make-quiz">Make Quiz</a></div>
                <div class="col-md-2"><a href="">Manage Quiz</a></div>
                <% if (session.getAttribute("user") != null) { %>
                <div class="col-md-4"><a href="http://localhost:8080/signout">Sign out</a></div>
                <% } else { %>
                <div class="col-md-4"></div>
                <% } %>
            </div>
        </nav>
    </header>
</div>

<div class="container-fluid col-10">
    <content>
        <!-- Login Form -->
        <form id="my-form" action="evaluate">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-3">
                    <h2>Welcome, </h2>
                </div>
                <div class="col-md-6"></div>
            </div>

            <!-- Time remaining -->
            <div class="row mt-5">
                <div class="col-md-5"></div>
                <div class="col-md-2">Time remaining:  <p id="countdown">2:00</p></div>
                <div class="col-md-5"></div>
            </div>

            <!-- Tick chose answer -->
            <div class="row mt-2">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <h3>Question ${sessionScope.quantity}: ${sessionScope.question.questionContent}?</h3>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                    <form>
                        <input type="checkbox" name="an1" value="${sessionScope.question.option1}">
                        <label>${sessionScope.question.option1}</label><br>
                        <input type="checkbox" name="an2" value="${sessionScope.question.option2}">
                        <label>${sessionScope.question.option2}</label><br>
                        <input type="checkbox" name="an3" value="${sessionScope.question.option3}">
                        <label>${sessionScope.question.option3}</label><br>
                        <input type="checkbox" name="an4" value="${sessionScope.question.option4}">
                        <label>${sessionScope.question.option4}</label><br><br>
                        <input type="submit" class="button-submit" value="Submit">
                    </form>
                </div>
            </div>
        </form>
    </content>
</div>

<script>
    var timeLeft = 120;
    var countdown = document.getElementById("countdown");

    function updateCountdown() {
        var minutes = Math.floor(timeLeft / 60);
        var seconds = timeLeft % 60;

        countdown.textContent = minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

        if (timeLeft === 0) {
            clearInterval(interval);
            countdown.textContent = "Hết thời gian";
            document.getElementById("my-form").submit();
        }
        timeLeft--;
    }
    var interval = setInterval(updateCountdown, 1000);
</script>
</body>

</html>