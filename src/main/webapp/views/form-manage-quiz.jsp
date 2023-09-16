<%@ page import="com.example.assignment2.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.assignment2.Question" %>
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
    <div class="row m-4">
        <div class="col-md-2"></div>
        <div class="col-md-6 text-center">Question</div>
        <div class="col-md-2 text-center">DateCreated</div>
        <div class="col-md-2"></div>
    </div>

    <% List <Question> list = (List) session.getAttribute("questionList");
        for (Question question : list) {%>
    <div class="row m-4">
        <div class="col-md-2"></div>
        <div class="col-md-6"><p><%= question.getQuestionContent()%></p></div>
        <div class="col-md-2 text-center"><p><%= question.getCreatedDate()%></p></div>
        <div class="col-md-2"></div>
    </div>
        <%}%>
</div>