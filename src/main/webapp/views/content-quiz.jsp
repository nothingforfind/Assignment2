<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<content>
    <!-- Login Form -->
    <form>
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
            <div class="col-md-2">Time remaining: </div>
            <div class="col-md-5"></div>
        </div>

        <!-- Tick chose answer -->
        <div class="row mt-2">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <h3>Question 1: How many citizen in Vietnam?</h3>
            </div>
        </div>

        <div class="row mt-2">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <form action="/action_page.php">
                    <input type="radio" id="vehicle1" name="vehicle" value="Bike">
                    <label for="vehicle1"> I have a bike</label><br>
                    <input type="radio" id="vehicle2" name="vehicle" value="Car">
                    <label for="vehicle2"> I have a car</label><br>
                    <input type="radio" id="vehicle3" name="vehicle" value="Boat">
                    <label for="vehicle3"> I have a boat</label><br><br>
                    <input type="submit" class="button-submit" value="Submit">
                </form>
            </div>
        </div>
    </form>
</content>