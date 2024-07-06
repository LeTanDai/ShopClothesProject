<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="themes/css/login.css" rel="stylesheet" type="text/css" />
    <title>Edit Profile</title>
</head>
<body>
    <div id="logreg-forms">
        <form class="form-signin" action="EditProfileController" method="post" accept-charset="UTF-8">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Account Detail</h1>
            <p class="text-success">${mess}</p>
            <label for="username">Username</label>
            <input name="username" type="text" id="username" class="form-control" value="${sessionScope.account.username}" required="" autofocus="" readonly="">
            <label for="password">Password</label>
            <input name="password" type="password" id="password" class="form-control" value="${sessionScope.account.password}" required="" autofocus="" readonly="">
            <label for="name">Full Name</label>
            <input name="name" type="text" id="name" class="form-control" value="${sessionScope.account.name}" required="" autofocus="">
            <label for="address">Address</label>
            <input name="address" type="text" id="address" class="form-control" value="${sessionScope.account.address}" required="" autofocus="">
            <label for="phone">Phone</label>
            <input name="phone" type="text" id="phone" class="form-control" value="${sessionScope.account.phone}" required="" autofocus="">
            <label for="email">Email</label>
            <input name="email" type="text" id="email" class="form-control" value="${sessionScope.account.email}" required="" autofocus="">
            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Edit</button>
            <a href="HomeController"><i class="fas fa-angle-left"></i>Back</a>
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
        function toggleResetPswd(e) {
            e.preventDefault();
            $('#logreg-forms .form-signin').toggle() // display:block or none
            $('#logreg-forms .form-reset').toggle() // display:block or none
        }

        function toggleSignUp(e) {
            e.preventDefault();
            $('#logreg-forms .form-signin').toggle(); // display:block or none
            $('#logreg-forms .form-signup').toggle(); // display:block or none
        }

        $(() => {
            // Login Register Form
            $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
            $('#logreg-forms #cancel_reset').click(toggleResetPswd);
            $('#logreg-forms #btn-signup').click(toggleSignUp);
            $('#logreg-forms #cancel_signup').click(toggleSignUp);
        })
    </script>
</body>
</html>
