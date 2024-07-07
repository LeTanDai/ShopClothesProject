<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
        <link rel="stylesheet" type="text/css" href="admin/css/main.css">
        <script src="admin/js/main.js"></script>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
            select {
                width: 32.3%;
                margin: 0;
                font-size: 100%;
                padding: 5px 10px 5px 10px;
                font-family: Segoe UI, Helvetica, sans-serif;
                border: 1px solid #D0D0D0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                border-radius: 20px;
                outline: none;
            }
        </style>
    </head>
    <body>
        <form id="form" action="EditUserServlet" method="post">
            <div class="">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <span class="thong-tin-thanh-toan">
                                        <h5>Edit information of User</h5>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <input class="form-control" readonly name="id" type="hidden" value="${user.id}">
                               
                                <div class="form-group col-md-6">
                                    <label class="control-label">Username</label>
                                    <input class="form-control" readonly name="username" type="text" value="${user.username}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Full Name</label>
                                    <input class="form-control" required="" name="fullname" type="text" value="${user.name}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Phone</label>
                                    <input class="form-control" required="" name="phone" type="text" value="${user.phone}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Email</label>
                                    <input class="form-control" required="" name="email" type="text" value="${user.email}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Address</label>
                                    <input class="form-control" required="" name="address" type="text" value="${user.address}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleSelect1" class="control-label">Administrative rights</label>
                                    <select name="role" class="form-control" id="exampleSelect1">
                                        <option value="admin" ${user.isAdmin == 1 ? 'selected' : ''}>Admin</option>
                                        <option value="user" ${user.isAdmin == 0 ? 'selected' : ''}>User</option>
                                    </select>
                                </div>
                                <br>
                                <button onclick="setValue()" class="btn btn-save" value="Update" type="submit">Save</button>
                                <a class="btn btn-cancel" data-dismiss="modal" href="ManageUserServlet">Cancel</a>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
