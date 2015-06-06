<!DOCTYPE html>
<html>
<head>
    <link href="template.css" type="text/css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link href=
    "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
    rel="stylesheet">
    <script src=
    "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href=
    "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"
    rel="stylesheet">

    <title></title>
</head>

<body>
    <div class="col-sm-8" >
        <h3 id="tabs">Providers</h3>

        <ul class="nav nav-tabs" id="list">
            <li class="active">
                <a data-toggle="tab" href="#A">Coursera</a>
            </li>

            <li>
                <a data-toggle="tab" href="#B">Edx</a>
            </li>

            <li>
                <a data-toggle="tab" href="#C">Udacity</a>
            </li>
        </ul>

        <div class="tabbable">
            <div class="tab-content">
                <div class="tab-pane active" id="A">
                    <p></p>

                    <div class="col-lg-4">
                        <p>E-mail</p>

                        <p>Password</p>
                    </div>

                    <div class="col-lg-4">
                        <div>
                        <input id="email" size="20" type="text"> <input id=
                        "password" size="20" type="password"></div>
                    </div>
                    <div class="col-lg-4">
                    <input class="button" id="submit1" type="button"
                    value="Submit">
                    </div>
                </div>

                <div class="tab-pane" id="B">
                    <div class="col-lg-4">
                        <p>E-mail</p>

                        <p>Password</p>
                        
                    </div>

                    <div class="col-lg-4">
                    <form>
                        <input id="email2" size="20" type="text" autocomplete="on"> 
                        <input id="password2" size="20" type="password" autocomplete="on">
                     </form>
                    </div>
                    <input class="button" id="submit2" type="button"
                    value="Submit" >
                   <ul class="list-group" style="margin-top:35px" id="B_list">
                        </ul>
                    
                </div>

                <div class="tab-pane" id="C">
                    <div class="col-lg-4">
                        <p>E-mail</p>

                        <p>Password</p>
                    </div>

                    <div class="col-lg-4">
                        <input id="email3" size="20" type="text"> 
                        <input id="password3" size="20" type="password">
                    </div>
                    <input class="button" id="submit3" type="button"
                    value="Submit">
                </div>
            </div>
        </div><!-- /tabbable -->
    </div><script type="text/javascript">
  $.wait = function(ms) {
    var defer = $.Deferred();
    setTimeout(function() { defer.resolve(); }, ms);
    return defer;
};  
    
$( document ).ready(function() {
  $('#email2').val(localStorage.email);
});
$('#submit3').click(function () {
 
console.log($.trim($("#list li.active").text()))
        $.ajax({
             
            url: '/hello/123',
            type: 'POST',
            data: JSON.stringify({
                'email': $('#email3').val(),
                'password': $('#password3').val(),
                
                'platform': $.trim($("#list li.active").text())
            }),
                        contentType: "application/json; charset=utf-8",

            dataType: 'json',
            success: function (json) {
                
                console.log(json); // log the returned json to the console
            }
        })});
        
  $('#submit2').click(function () {
  
localStorage.setItem("email", $('#email2').val());
        $.ajax({
             
            url: '/hello/123',
            type: 'POST',
            data: JSON.stringify({
                'email': $('#email2').val(),
                'password': $('#password2').val(),
                'platform': $.trim($("#list li.active").text()).toLowerCase() 
            }),
                        contentType: "application/json; charset=utf-8",

            dataType: 'json',
            success: function (json) {
                $("#B_list").empty()
                $.each(json, function(key, value){
                $.wait(200)
    $("#B_list").append('<a href='+key+  ' class="list-group-item">'+value+'</li>').hide().show('slow');
});
            }
        })});
    </script>
</body>
</html>
