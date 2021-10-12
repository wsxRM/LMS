<%@ page import="com.laitec.lms.Model.TO.Staff" %>
<%@ page import="com.laitec.lms.Model.TO.Student" %>
<%@ page import="com.laitec.lms.Model.TO.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Staff staff;
    Student student;
    String head = "", firstName = "", lastName = "", username = "", password = "";
    int id = 0;

    if (request.getSession().getAttribute("staff") != null) {
        staff = (Staff) request.getSession().getAttribute("staff");
        head = "Staff";
        firstName = staff.getFirstName();
        lastName = staff.getLastName();
        username = staff.getUsername();
        password = staff.getPassword();
        id = staff.getId();
    } else if (request.getSession().getAttribute("student") != null) {
        student = (Student) request.getSession().getAttribute("student");
        head = "Student";
        firstName = student.getFirstName();
        lastName = student.getLastName();
        username = student.getUsername();
        password = student.getPassword();
        id = student.getId();
    }
%>

<html>

<head>

    <title><%=head + " Profile Page"%>
    </title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">

</head>

<style>

    body {
        background: #67B26F; /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F); /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #4ca2cd, #67B26F); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        padding: 0;
        margin: 0;
        font-family: 'Lato', sans-serif;
        color: #000;
    }

    * {
        box-sizing: border-box;
    }

    a {
        font-family: "Raleway", sans-serif;
        text-decoration: none;
        outline: none;
    }

    a:hover, a:focus {
        color: #373e18;
    }

    section {
        float: left;
        width: 100%;
        padding-bottom: 3em;
    }

    h2 {
        color: #1a0e0e;
        font-size: 26px;
        font-weight: 700;
        margin: 0;
        line-height: normal;
        text-transform: uppercase;
    }

    h2 span {
        display: block;
        padding: 0;
        font-size: 18px;
        opacity: 0.7;
        margin-top: 5px;
        text-transform: uppercase;
    }

    #float-right {
        float: right;
    }

    .ScriptHeader {
        float: left;
        width: 100%;
        padding: 2em 0;
    }

    .rt-heading {
        margin: 0 auto;
        text-align: center;
    }

    .ScriptContent {
        line-height: 28px;
    }

    .ScriptHeader h1 {
        font-family: "brandon-grotesque", "Brandon Grotesque", "Source Sans Pro", "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
        text-rendering: optimizeLegibility;
        -webkit-font-smoothing: antialiased;
        color: #6a4aed;
        font-size: 26px;
        font-weight: 700;
        margin: 0;
        line-height: normal;
    }

    .ScriptHeader h2 {
        color: #312c8f;
        font-size: 20px;
        font-weight: 400;
        margin: 5px 0 0;
        line-height: normal;

    }

    .ScriptHeader h1 span {
        display: block;
        padding: 0;
        font-size: 22px;
        opacity: 0.7;
        margin-top: 5px;
    }

    .ScriptHeader span {
        display: block;
        padding: 0;
        font-size: 22px;
        opacity: 0.7;
        margin-top: 5px;
    }

    .rt-container {
        margin: 0 auto;
        padding-left: 12px;
        padding-right: 12px;
    }

    .rt-row:before, .rt-row:after {
        display: table;
        line-height: 0;
        content: "";
    }

    .rt-row:after {
        clear: both;
    }

    [class^="col-rt-"] {
        box-sizing: border-box;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -o-box-sizing: border-box;
        -ms-box-sizing: border-box;
        padding: 0 15px;
        min-height: 1px;
        position: relative;
    }

    @media (min-width: 768px) {
        .rt-container {
            width: 750px;
        }

        [class^="col-rt-"] {
            float: left;
            width: 49.9999999999%;
        }

        .col-rt-6, .col-rt-12 {
            width: 100%;
        }
    }

    @media (min-width: 1200px) {
        .rt-container {
            width: 1170px;
        }

        .col-rt-1 {
            width: 16.6%;
        }

        .col-rt-2 {
            width: 30.33%;
        }

        .col-rt-3 {
            width: 50%;
        }

        .col-rt-4 {
            width: 67.664%;
        }

        .col-rt-5 {
            width: 83.33%;
        }
    }

    @media only screen and (min-width: 240px) and (max-width: 768px) {
        .ScriptTop h1, .ScriptTop ul {
            text-align: center;
        }

        .ScriptTop h1 {
            margin-top: 0;
            margin-bottom: 15px;
        }

        .ScriptTop ul {
            margin-top: 12px;
        }

        .ScriptHeader h1,
        .ScriptHeader h2,
        .scriptnav ul {
            text-align: center;
        }

        .scriptnav ul {
            margin-top: 12px;
        }

        #float-right {
            float: none;
        }
    }

    /**************/

    .student-profile .card {
        border-radius: 10px;
    }

    .student-profile .card .card-header .profile_img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        margin: 10px auto;
        border: 10px solid #ccc;
        border-radius: 50%;
    }

    .student-profile .card h3 {
        font-size: 20px;
        font-weight: 700;
    }

    .student-profile .card p {
        font-size: 16px;
        color: #000;
    }

    /***************/

    /* Full-width input fields */
    input[type=text], input[type=number], select {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    /* Add a background color when the inputs get focus */
    input[type=text]:focus, input[type=number]:focus, select:focus {
        background-color: #ddd;
        outline: none;
    }

    /* Set a style for all buttons */
    button {
        background-color: #04AA6D;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    button:hover {
        opacity: 1;
    }

    /* Extra styles for the cancel button */
    .cancel {
        padding: 14px 20px;
        background-color: #f44336;
    }

    /* Float cancel and signup buttons and add an equal width */
    .cancel, .enter {
        float: left;
        width: 50%;
    }

    /* Add padding to container1 elements */
    .container1 {
        padding: 16px;
    }

    /* The Modal (background) */
    .modal1 {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        padding-top: 50px;
    }

    /* Modal Content/Box */
    .modal1-content {
        background-color: #fefefe;
        margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* Style the horizontal ruler */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* The Close Button (x) */
    .close1 {
        position: absolute;
        right: 35px;
        top: 15px;
        font-size: 40px;
        font-weight: bold;
        color: #f1f1f1;
    }

    .close1:hover, .close1:focus {
        color: #f44336;
        cursor: pointer;
    }

    /* Clear floats */
    .clearfix1 {
        content: "";
        clear: both;
        display: table;
    }

    /* Change styles for cancel button and signup button on extra small screens */
    @media screen and (max-width: 300px) {
        .cancel, .enter {
            width: 100%;
        }
    }

    .booksList, .usersList {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    .booksList td, .booksList th,
    .usersList td, .usersList th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    .booksList tr:nth-child(even), .usersList tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .booksList tr:hover, .usersList tr:hover {
        background-color: #ddd;
    }

    .booksList th, .usersList th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        background-color: #04AA6D;
        color: white;
    }

</style>

<body>

<header class="ScriptHeader">

    <div class="rt-container">
        <div class="col-rt-12">
            <div class="rt-heading">

                <h1><%=head + " Profile"%>
                </h1>

            </div>
        </div>
    </div>

</header>

<section>

    <div class="rt-container">
        <div class="col-rt-12">
            <div class="ScriptContent">
                <div class="student-profile py-4">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-4">
                                <div class="card shadow-sm">

                                    <div class="card-header bg-transparent text-center">
                                        <img class="profile_img"
                                             src="https://www.kamarajsoftwaresolutions.com/assets/img/school/library/3.png"
                                             alt="librarian">
                                        <h3><%=firstName + " " + lastName%>
                                        </h3>
                                    </div>

                                    <div class="card-body">
                                        <p class="mb-0"><strong class="pr-1">ID:</strong><%=id%>
                                        </p>
                                        <p class="mb-0"><strong
                                                class="pr-1">Username:</strong><%=username%>
                                        </p>
                                        <p class="mb-0"><strong
                                                class="pr-1">Password:</strong><%=password%>
                                        </p>
                                    </div>

                                </div>
                            </div>

                            <div class="col-lg-8">
                                <div class="card shadow-sm">

                                    <div class="card-header bg-transparent border-0">
                                        <h3 class="mb-0"><i class="far fa-clone pr-1"></i>Desktop</h3>
                                    </div>

                                    <div class="card-body pt-0">

                                        <button type="button"
                                                onclick="document.getElementById('id01').style.display='block'"
                                                style="width:auto;">Books List
                                        </button>

                                        <button type="button"
                                                onclick="document.getElementById('id02').style.display='block'"
                                                style="width:auto;">Search Book
                                        </button>

                                        <button type="button"
                                                onclick="document.getElementById('id03').style.display='block'"
                                                style="width:auto;">Borrow Book
                                        </button>

                                        <button type="button"
                                                onclick="document.getElementById('id04').style.display='block'"
                                                style="width:auto;">Return Book
                                        </button>

                                        <br>

                                        <button type="button"
                                                onclick="document.getElementById('id05').style.display='block'"
                                                style="width:auto;">Borrowed Books List
                                        </button>

                                        <button type="button"
                                                onclick="document.getElementById('id06').style.display='block'"
                                                style="width:auto;">Update User
                                        </button>

                                        <button type="button" onclick="window.location='index.jsp'" style="width:auto;">
                                            Exit
                                        </button>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<div id="id01" class="modal1">

    <span onclick="document.getElementById('id01').style.display='none'; document.getElementById('id1').innerHTML=''"
          class="close1" title="Close Books List">&times;</span>

    <form class="modal1-content" action="user" method="get">
        <div class="container1">

            <h1>Books List</h1>
            <hr>

            <%
                if (request.getSession().getAttribute("listBooks") != null) {
            %>

            <script>document.getElementById('id01').style.display = 'block';</script>

            <table id="id1" class="booksList">

                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Publication</th>
                </tr>

                <%
                    ArrayList<Book> books = (ArrayList<Book>) request.getSession().getAttribute("listBooks");
                    for (Book book : books) {
                        if (book.getAccount() == null) {
                %>

                <tr>
                    <td><%=book.getTitle()%>
                    </td>
                    <td><%=book.getAuthor()%>
                    </td>
                    <td><%=book.getIsbn()%>
                    </td>
                    <td><%=book.getPublication()%>
                    </td>
                </tr>

                <%
                        }
                    }
                    request.getSession().removeAttribute("listBooks");
                %>

            </table>

            <%
            } else if (request.getSession().getAttribute("booksListError") != null) {
                String booksListError = (String) request.getSession().getAttribute("booksListError");
            %>

            <script>document.getElementById('id01').style.display = 'block';</script>

            <span id="id1" style="color: red"><%=booksListError%></span>

            <%
                    request.getSession().removeAttribute("booksListError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id01').style.display='none'; document.getElementById('id1').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="listBooks" style="width:auto;">Show</button>
            </div>

        </div>
    </form>

</div>

<div id="id02" class="modal1">

    <span onclick="Reset('attribute'); document.getElementById('id02').style.display='none'; document.getElementById('id2').innerHTML=''"
          class="close1" title="Close Search Book">&times;</span>

    <form class="modal1-content" action="user" method="get">
        <div class="container1">

            <h1>Search Book</h1>
            <p>Please fill in this form to Search books by chosen attribute.</p>
            <hr>

            <label><b>Choose your search attribute:</b></label>
            <label>
                <select id="attribute" name="attribute" onchange="bookSearchItems(this)">
                    <option></option>
                    <option value="title">Title</option>
                    <option value="author">Author</option>
                    <option value="isbn">ISBN</option>
                    <option value="publication">Publication</option>
                </select>
            </label>

            <div id="results"></div>

            <%
                if (request.getSession().getAttribute("searchBook") != null) {
            %>

            <script>document.getElementById('id02').style.display = 'block';</script>

            <table id="id2" class="booksList">

                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Publication</th>
                </tr>

                <%
                    ArrayList<Book> books = (ArrayList<Book>) request.getSession().getAttribute("searchBook");
                    for (Book book : books) {
                %>

                <tr>
                    <td><%=book.getTitle()%>
                    </td>
                    <td><%=book.getAuthor()%>
                    </td>
                    <td><%=book.getIsbn()%>
                    </td>
                    <td><%=book.getPublication()%>
                    </td>
                </tr>

                <%
                    }
                    request.getSession().removeAttribute("searchBook");
                %>

            </table>

            <%
                }
            %>

            <%
                if (request.getSession().getAttribute("searchBookError") != null) {
                    String searchBookError = (String) request.getSession().getAttribute("searchBookError");
            %>

            <script>document.getElementById('id02').style.display = 'block';</script>
            <span id="id2" style="color: red"><%=searchBookError%></span>

            <%
                    request.getSession().removeAttribute("searchBookError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="Reset('attribute'); document.getElementById('id02').style.display='none'; document.getElementById('id2').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="searchBook" style="width:auto;">Search</button>
            </div>

        </div>
    </form>

</div>

<div id="id03" class="modal1">

    <span onclick="document.getElementById('id03').style.display='none'; document.getElementById('id3').innerHTML=''"
          class="close1" title="Close Borrow Book">&times;</span>

    <form class="modal1-content" action="user" method="get">
        <div class="container1">

            <h1>Borrow Book</h1>
            <p>Please fill in this form to borrow a book by ISBN.</p>
            <hr>

            <label><b>ISBN</b></label>
            <label>
                <input type="number" placeholder="Enter ISBN" name="isbn" required>
            </label>

            <br>

            <%
                if (request.getSession().getAttribute("borrowError") != null) {
                    String borrowError = (String) request.getSession().getAttribute("borrowError");
            %>

            <script>document.getElementById('id03').style.display = 'block';</script>

            <%
                if (Objects.equals(borrowError, "Book borrowed.")) {
            %>

            <span id="id3" style="color: green"><%=borrowError%></span>

            <%
            } else {
            %>

            <span id="id3" style="color: red"><%=borrowError%></span>

            <%
                    }
                    request.getSession().removeAttribute("borrowError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id03').style.display='none'; document.getElementById('id3').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="borrowBook" style="width:auto;">Borrow</button>
            </div>

        </div>
    </form>

</div>

<div id="id04" class="modal1">

    <span onclick="document.getElementById('id04').style.display='none'; document.getElementById('id4').innerHTML=''"
          class="close1" title="Close Return Book">&times;</span>

    <form class="modal1-content" action="user" method="get">
        <div class="container1">

            <h1>Return Book</h1>
            <p>Please fill in this form to Return a book by ISBN.</p>
            <hr>

            <label><b>ISBN</b></label>
            <label>
                <input type="number" placeholder="Enter ISBN" name="isbn" required>
            </label>

            <br>

            <%
                if (request.getSession().getAttribute("returnError") != null) {
                    String returnError = (String) request.getSession().getAttribute("returnError");
            %>

            <script>document.getElementById('id04').style.display = 'block';</script>

            <%
                if (Objects.equals(returnError, "Book returned.")) {
            %>

            <span id="id4" style="color: green"><%=returnError%></span>

            <%
            } else {
            %>

            <span id="id4" style="color: red"><%=returnError%></span>

            <%
                    }
                    request.getSession().removeAttribute("returnError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id04').style.display='none'; document.getElementById('id4').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="returnBook" style="width:auto;">Return</button>
            </div>

        </div>
    </form>

</div>

<div id="id05" class="modal1">

    <span onclick="document.getElementById('id05').style.display='none'; document.getElementById('id5').innerHTML=''"
          class="close1" title="Close Borrowed Books List">&times;</span>

    <form class="modal1-content" action="user" method="get">
        <div class="container1">

            <h1>Borrowed Books List</h1>
            <hr>

            <%
                if (request.getSession().getAttribute("listBorrowedBooks") != null) {
            %>

            <script>document.getElementById('id05').style.display = 'block';</script>

            <table id="id5" class="booksList">

                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Publication</th>
                </tr>

                <%
                    List<Book> books = (List<Book>) request.getSession().getAttribute("listBorrowedBooks");
                    for (Book book : books) {
                %>

                <tr>
                    <td><%=book.getTitle()%>
                    </td>
                    <td><%=book.getAuthor()%>
                    </td>
                    <td><%=book.getIsbn()%>
                    </td>
                    <td><%=book.getPublication()%>
                    </td>
                </tr>

                <%
                    }
                    request.getSession().removeAttribute("listBorrowedBooks");
                %>

            </table>

            <%
            } else if (request.getSession().getAttribute("borrowedBooksListError") != null) {
                String borrowedBooksListError = (String) request.getSession().getAttribute("borrowedBooksListError");
            %>

            <script>document.getElementById('id05').style.display = 'block';</script>

            <span id="id5" style="color: red"><%=borrowedBooksListError%></span>

            <%
                    request.getSession().removeAttribute("borrowedBooksListError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id05').style.display='none'; document.getElementById('id5').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="listBorrowedBooks" style="width:auto;">Show
                </button>
            </div>

        </div>
    </form>

</div>

<div id="id06" class="modal1">

    <span onclick="document.getElementById('id06').style.display='none'; document.getElementById('id6').innerHTML=''"
          class="close1" title="Close Update User">&times;</span>

    <form class="modal1-content" action="user" method="get">
        <div class="container1">

            <h1>Update User</h1>
            <p>Please fill in this form to update user.</p>
            <hr>

            <label><b>Username</b></label>
            <label>
                <input type="text" placeholder="Enter Username" name="username" required>
            </label>

            <label><b>Password</b></label>
            <label>
                <input type="text" placeholder="Enter Password" name="password" required>
            </label>

            <label><b>First Name</b></label>
            <label>
                <input type="text" placeholder="Enter First Name" name="firstName" required>
            </label>

            <label><b>Last Name</b></label>
            <label>
                <input type="text" placeholder="Enter Last Name" name="lastName" required>
            </label>

            <br>

            <%
                if (head.equals("Staff")) {
            %>

            <label><b>Department Name</b></label>
            <label>
                <input type="text" placeholder="Enter Department Name" name="deptName" required>
            </label>

            <%
            } else if (head.equals("Student")) {
            %>

            <label><b>Class Name</b></label>
            <label>
                <input type="text" placeholder="Enter Class Name" name="className" required>
            </label>

            <%
                }
                if (request.getSession().getAttribute("updateError") != null) {
                    String updateError = (String) request.getSession().getAttribute("updateError");
            %>

            <script>document.getElementById('id06').style.display = 'block';</script>

            <%
                if (Objects.equals(updateError, "Staff updated.") || Objects.equals(updateError, "Student updated.")) {
            %>

            <br>

            <span id="id6" style="color: green"><%=updateError%></span>

            <%
            } else {
            %>

            <span id="id6" style="color: red"><%=updateError%></span>

            <%
                    }
                    request.getSession().removeAttribute("updateError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id06').style.display='none';document.getElementById('id6').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="updateUser" style="width:auto;">Update
                </button>
            </div>

        </div>
    </form>

</div>

<script>

    function Reset(eid) {
        const dropDown = document.getElementById(eid);
        dropDown.selectedIndex = 0;
        document.getElementById('results').style.display = 'none';
    }

    function bookSearchItems(_this) {
        const item = _this.value; //get the value
        const results = document.querySelector('#results'); //append results
        results.innerHTML = '' //clear the results on each update
        const input = document.createElement("input"); //create input
        const label = document.createElement("label"); //create label
        const b = document.createElement("B");
        let t = null;
        switch (item) {
            case "title":
                t = document.createTextNode("Title");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter Title"; //add a placeholder
                input.name = "title"; // set the CSS class
                break;
            case "author":
                t = document.createTextNode("author");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter author"; //add a placeholder
                input.name = "author"; // set the CSS class
                break;
            case "isbn":
                t = document.createTextNode("ISBN");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "number";
                input.placeholder = "Enter ISBN"; //add a placeholder
                input.name = "isbn"; // set the CSS class
                break;
            case "publication":
                t = document.createTextNode("Publication");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "number";
                input.placeholder = "Enter Publication"; //add a placeholder
                input.name = "publication"; // set the CSS class
                break;
        }
        if (item !== "") {
            results.appendChild(label); //append label
            results.appendChild(document.createElement("br"));
            results.appendChild(input); //append input
            results.appendChild(document.createElement("br"));
            document.getElementById('results').style.display = 'block';
        }
    }

</script>

</body>

</html>
