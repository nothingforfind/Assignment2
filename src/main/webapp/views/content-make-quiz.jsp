<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="">

    <div class="row mt-2">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-question">Question:</div>
        <div class="col-md-4">
            <textarea rows="4" cols="60" name="text" placeholder="Enter text"></textarea>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-question">Option 1:</div>
        <div class="col-md-4">
            <textarea rows="2" cols="60" name="text" placeholder="Enter text"></textarea>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-question">Option 2:</div>
        <div class="col-md-4">
            <textarea rows="2" cols="60" name="text" placeholder="Enter text"></textarea>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-question">Option 3:</div>
        <div class="col-md-4">
            <textarea rows="2" cols="60" name="text" placeholder="Enter text"></textarea>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-question">Option 4:</div>
        <div class="col-md-4">
            <textarea rows="2" cols="60" name="text" placeholder="Enter text"></textarea>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-question">Answer:</div>
        <div class="col-md-5">
            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
            <label for="vehicle1" class="checkbox-make-answer"> I have a bike</label>
            <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
            <label for="vehicle2" class="checkbox-make-answer"> I have a car</label>
            <input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
            <label for="vehicle3" class="checkbox-make-answer"> I have a boat</label>
            <input type="checkbox" id="vehicle4" name="vehicle4" value="Train">
            <label for="vehicle4" class="checkbox-make-answer"> I have a Train</label>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-center">
            <input type="submit" class="button-submit" value="Submit">
        </div>
    </div>
</form>