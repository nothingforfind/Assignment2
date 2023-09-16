<%@ page import="com.example.assignment2.User" %>
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
    <form action="/filled-question">

        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1 label-question">Question:</div>
            <div class="col-md-4">
                <textarea rows="4" cols="60" name="questionContent" placeholder="Enter text"></textarea>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1 label-question">Option 1:</div>
            <div class="col-md-4">
                <textarea rows="2" cols="60" name="option1" placeholder="Enter text"></textarea>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1 label-question">Option 2:</div>
            <div class="col-md-4">
                <textarea rows="2" cols="60" name="option2" placeholder="Enter text"></textarea>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1 label-question">Option 3:</div>
            <div class="col-md-4">
                <textarea rows="2" cols="60" name="option3" placeholder="Enter text"></textarea>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1 label-question">Option 4:</div>
            <div class="col-md-4">
                <textarea rows="2" cols="60" name="option4" placeholder="Enter text"></textarea>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1 label-question">Answer:</div>
            <div class="col-md-5">
                <input type="checkbox" name="answer1" value="1">
                <label class="checkbox-make-answer">A</label>
                <input type="checkbox" name="answer2" value="2">
                <label class="checkbox-make-answer">B</label>
                <input type="checkbox" name="answer3" value="3">
                <label class="checkbox-make-answer">C</label>
                <input type="checkbox" name="answer4" value="4">
                <label class="checkbox-make-answer">D</label>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-3"></div>
            <div class="col-md-3 text-center">
                <input type="submit" class="button-submit" value="Submit">
            </div>
        </div>
    </form>

    <% if (request.getAttribute("error") != null) { %>
    <script>
        var errorMessage = '<%= request.getAttribute("error") %>';
        alert(errorMessage);
    </script>
    <% } %>
</div>
</body>

</html>