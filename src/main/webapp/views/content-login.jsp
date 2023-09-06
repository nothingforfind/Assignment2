<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<content>
    <!-- Login Form -->
    <form action="/check" method="post">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-3">
                <h2>Login Form</h2>
            </div>
            <div class="col-md-5"></div>
        </div>
        

        <!-- Username -->
        <div class="row mt-4">
            <div class="col-md-3"></div>
            <div class="col-md-1">Username: </div>
            <div class="col-md-2">
                <input type="text" id="username" name="fname">
            </div>
            <div class="col-md-6"></div>
        </div>

        <!-- Password -->
        <div class="row mt-2">
            <div class="col-md-3"></div>
            <div class="col-md-1">Password: </div>
            <div class="col-md-2">
                <input type="text" id="password" name="fname">
            </div>
            <div class="col-md-6"></div>
        </div>

        <!-- Button -->
        <div class="row mt-4">
            <div class="col-md-4"></div>
            <div class="col-md-2">
                <input type="submit" name="submitButton" value="Signin">
                <input type="submit" name="submitButton" value="Registration" style="border: none; background-color: transparent; cursor: pointer;">
            </div>
            <div class="col-md-6"></div>
        </div>
    </form>
</content>