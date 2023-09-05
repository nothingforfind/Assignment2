<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form>
    <div class="row col-10">
        <div class="col-md-5"></div>
        <div class="col-md-2 text-center">
            <h2>Registrator Form</h2>
        </div>
        <div class="col-md-5"></div>
    </div>

    <div class="row mt-4">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-register">Username: </div>
        <div class="col-md-2">
            <input type="text" id="fname" name="fname">
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-register">Password: </div>
        <div class="col-md-2">
            <input type="text" id="fname" name="fname">
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-register">Usertype: </div>
        <div class="col-md-2">
            <select name="cars" id="cars">
                <option value="volvo">Volvo</option>
                <option value="saab">Saab</option>
                <option value="mercedes">Mercedes</option>
                <option value="audi">Audi</option>
            </select>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-3"></div>
        <div class="col-md-1 label-register">Email: </div>
        <div class="col-md-2">
            <input type="text" id="fname" name="fname">
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-3"></div>
        <div class="col-md-3 text-center">
            <input type="submit" class="button-submit" value="Submit">
        </div>
    </div>
</form>