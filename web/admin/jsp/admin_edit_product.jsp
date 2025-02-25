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
        <script src="../js/main.js"></script>
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
    <body>
        <form id="form" action="EditProductServlet" method="get">
            <div class="" >
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group  col-md-12">
                                    <span class="thong-tin-thanh-toan">
                                        <h5>Edit product information</h5>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label class="control-label">Product Code</label>
                                    <input class="form-control" type="text" readonly name="product_id" value="${product.id}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label class="control-label">Quantity</label>
                                    <input class="form-control" type="text" name="product_stock" value="${product.quantity}">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="exampleSelect1" class="control-label">Category</label>
                                    <select name="category_id" class="form-control" id="exampleSelect1">
                                        <c:forEach items="${requestScope.LIST_CATEGORIES}" var="cat">
                                            <option ${cat.cid == pcategory.cid ? "selected" : ""} value="${cat.getCid()}">${cat.getCname()}</option>
                                  </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Product Name</label>
                                    <input class="form-control" type="text" name="product_name" required value="${product.name}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label class="control-label">Price</label>
                                    <input class="form-control" type="number" name="product_price" required value="${product.price}">
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Description</label>
                                    <textarea class="form-control" type="text" name="product_description">${product.description}</textarea>
                                </div>

                                <div class="form-group col-md-12">
                                    <label class="control-label">Image</label>
                                  
                         
                                    <div id="boxchoice">
                                        <input class="form-control" type="text" value="${product.image}" id="image-url-input" name="product_img" placeholder="Enter image URL">
                                        <p style="clear:both"></p>
                                    </div>
                                </div>
                            </div>
                            <BR>
                            <button onclick="setValue()" class="btn btn-save" name="action" value="update" type="submit">Save</button>
                            <a class="btn btn-cancel" data-dismiss="modal" href="ManageProductServlet">Cancle</a>
                            <BR>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script  type="text/javascript">
            function addOption(selectElement, value, text) {
                var option = document.createElement("option");
                option.value = value;
                option.text = text;
                selectElement.add(option);
            }

            var defaultReleaseDate = document.getElementById("stringdateolb").value;
            var defaultDateArray = defaultReleaseDate.split('-');
            var defaultDay = parseInt(defaultDateArray[2]);
            var defaultMonth = parseInt(defaultDateArray[1]);
            var defaultYear = parseInt(defaultDateArray[0]);

            var daysSelect = document.getElementById('dobDay');
            var monthsSelect = document.getElementById('dobMonth');
            var yearsSelect = document.getElementById('dobYear');

            for (var day = 1; day <= 31; day++) {
                addOption(daysSelect, day, day);
            }

            for (var month = 1; month <= 12; month++) {
                addOption(monthsSelect, month, month);
            }

            var currentYear = new Date().getFullYear();
            for (var year = currentYear; year >= 1900; year--) {
                addOption(yearsSelect, year, year);
            }

            daysSelect.value = defaultDay;
            monthsSelect.value = defaultMonth;
            yearsSelect.value = defaultYear;


            function setValue() {
                var here = document.querySelector('#here');
                var dobDay = document.getElementById('dobDay').value;
                var dobMonthText = document.getElementById('dobMonth').value;
                var dobYear = document.getElementById('dobYear').value;
                if (dobMonthText < 10 && dobDay < 10) {
                    dobFull = dobYear + '-0' + dobMonthText + '-0' + dobDay;
                } else if (dobMonthText < 10 && !(dobDay < 10)) {
                    dobFull = dobYear + '-0' + dobMonthText + '-' + dobDay;
                } else if (dobDay < 10 && !(dobMonthText < 10)) {
                    dobFull = dobYear + '-' + dobMonthText + '-0' + dobDay;
                } else {
                    dobFull = dobYear + '-' + dobMonthText + '-' + dobDay;
                }
                here.value = dobFull;
            }
        </script>
    </body>
</html>