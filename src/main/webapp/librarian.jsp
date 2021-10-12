<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.laitec.lms.Model.TO.*" %>

<!DOCTYPE html>

<html>

<head>

    <title>Librarian Profile Page</title>
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

                <h1>Librarian Profile</h1>

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

                                    <%
                                        Librarian librarian = (Librarian) request.getSession().getAttribute("librarian");
                                    %>

                                    <div class="card-header bg-transparent text-center">
                                        <img class="profile_img"
                                             src="https://www.kamarajsoftwaresolutions.com/assets/img/school/library/3.png"
                                             alt="librarian">
                                        <h3><%=librarian.getFirstName() + " " + librarian.getLastName()%>
                                        </h3>
                                    </div>

                                    <div class="card-body">
                                        <p class="mb-0"><strong class="pr-1">ID:</strong><%=librarian.getId()%>
                                        </p>
                                        <p class="mb-0"><strong
                                                class="pr-1">Username:</strong><%=librarian.getUsername()%>
                                        </p>
                                        <p class="mb-0"><strong
                                                class="pr-1">Password:</strong><%=librarian.getPassword()%>
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
                                                style="width:auto;">Add Book
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id02').style.display='block'"
                                                style="width:auto;">Books List
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id03').style.display='block'"
                                                style="width:auto;">Update Book
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id04').style.display='block'"
                                                style="width:auto;">Delete Book
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id05').style.display='block'"
                                                style="width:auto;">Search Book
                                        </button>
                                        <br>
                                        <button type="button"
                                                onclick="document.getElementById('id06').style.display='block'"
                                                style="width:auto;">Users List
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id07').style.display='block'"
                                                style="width:auto;">Update Librarian
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id08').style.display='block'"
                                                style="width:auto;">Delete User
                                        </button>
                                        <button type="button"
                                                onclick="document.getElementById('id09').style.display='block'"
                                                style="width:auto;">Search User
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
          class="close1" title="Close Add Book">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Add Book</h1>
            <p>Please fill in this form to create a book.</p>
            <hr>

            <label><b>Title</b></label>
            <label>
                <input type="text" placeholder="Enter Title" name="title" required>
            </label>

            <label><b>Author Name</b></label>
            <label>
                <input type="text" placeholder="Enter Author Name" name="author" required>
            </label>

            <label><b>ISBN</b></label>
            <label>
                <input type="number" placeholder="Enter ISBN" name="isbn" required>
            </label>

            <label><b>Publication</b></label>
            <label>
                <input type="number" placeholder="Enter Publication" name="publication" required>
            </label>

            <br>

            <%
                if (request.getSession().getAttribute("addError") != null) {
                    String addError = (String) request.getSession().getAttribute("addError");
            %>

            <script>document.getElementById('id01').style.display = 'block';</script>

            <%
                if (Objects.equals(addError, "Book added.")) {
            %>

            <span id="id1" style="color: green"><%=addError%></span>

            <%
            } else {
            %>

            <span id="id1" style="color: red"><%=addError%></span>

            <%
                    }
                    request.getSession().removeAttribute("addError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id01').style.display='none'; document.getElementById('id1').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="addBook" style="width:auto;">Register</button>
            </div>

        </div>
    </form>

</div>

<div id="id02" class="modal1">

    <span onclick="document.getElementById('id02').style.display='none'; document.getElementById('id2').innerHTML=''"
          class="close1" title="Close Books List">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Books List</h1>
            <hr>

            <%
                if (request.getSession().getAttribute("books") != null) {
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
                    ArrayList<Book> books = (ArrayList<Book>) request.getSession().getAttribute("books");
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
                    request.getSession().removeAttribute("books");
                %>

            </table>

            <%
            } else if (request.getSession().getAttribute("booksListError") != null) {
                String booksListError = (String) request.getSession().getAttribute("booksListError");
            %>

            <script>document.getElementById('id02').style.display = 'block';</script>

            <span id="id2" style="color: red"><%=booksListError%></span>

            <%
                    request.getSession().removeAttribute("booksListError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id02').style.display='none'; document.getElementById('id2').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="listBooks" style="width:auto;">Show</button>
            </div>

        </div>
    </form>

</div>

<div id="id03" class="modal1">

    <span onclick="document.getElementById('id03').style.display='none'; document.getElementById('id3').innerHTML=''"
          class="close1" title="Close Update Book">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Update Book</h1>
            <p>Please fill in this form to update a book by ISBN.</p>
            <hr>

            <label><b>Title</b></label>
            <label>
                <input type="text" placeholder="Enter Title" name="title" required>
            </label>

            <label><b>Author Name</b></label>
            <label>
                <input type="text" placeholder="Enter Author Name" name="author" required>
            </label>

            <label><b>ISBN</b></label>
            <label>
                <input type="number" placeholder="Enter ISBN" name="isbn" required>
            </label>

            <label><b>Publication</b></label>
            <label>
                <input type="number" placeholder="Enter Publication" name="publication" required>
            </label>

            <br>

            <%
                if (request.getSession().getAttribute("updateError") != null) {
                    String updateError = (String) request.getSession().getAttribute("updateError");
            %>

            <script>document.getElementById('id03').style.display = 'block';</script>

            <%
                if (Objects.equals(updateError, "Book updated.")) {
            %>

            <span id="id3" style="color: green"><%=updateError%></span>

            <%
            } else {
            %>

            <span id="id3" style="color: red"><%=updateError%></span>

            <%
                    }
                    request.getSession().removeAttribute("updateError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id03').style.display='none';document.getElementById('id3').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="updateBook" style="width:auto;">Update</button>
            </div>

        </div>
    </form>

</div>

<div id="id04" class="modal1">

    <span onclick="document.getElementById('id04').style.display='none'; document.getElementById('id4').innerHTML=''"
          class="close1" title="Close Delete Book">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Delete Book</h1>
            <p>Please fill in this form to delete a book by ISBN.</p>
            <hr>

            <label><b>ISBN</b></label>
            <label>
                <input type="number" placeholder="Enter ISBN" name="isbn" required>
            </label>

            <br>

            <%
                if (request.getSession().getAttribute("deleteError") != null) {
                    String deleteError = (String) request.getSession().getAttribute("deleteError");
            %>

            <script>document.getElementById('id04').style.display = 'block';</script>

            <%
                if (Objects.equals(deleteError, "Book deleted.")) {
            %>

            <span id="id4" style="color: green"><%=deleteError%></span>

            <%
            } else {
            %>

            <span id="id4" style="color: red"><%=deleteError%></span>

            <%
                    }
                    request.getSession().removeAttribute("deleteError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id04').style.display='none'; document.getElementById('id4').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="deleteBook" style="width:auto;">Delete</button>
            </div>

        </div>
    </form>

</div>

<div id="id05" class="modal1">

    <span onclick="Reset('attribute1'); document.getElementById('id05').style.display='none'; document.getElementById('id5').innerHTML=''"
          class="close1" title="Close Search Book">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Search Book</h1>
            <p>Please fill in this form to Search books by chosen attribute.</p>
            <hr>

            <label><b>Choose your search attribute:</b></label>
            <label>
                <select id="attribute1" name="attribute" onchange="bookSearchItems(this)">
                    <option></option>
                    <option value="title">Title</option>
                    <option value="author">Author</option>
                    <option value="isbn">ISBN</option>
                    <option value="publication">Publication</option>
                </select>
            </label>

            <div id="results"></div>

            <%
                if (request.getSession().getAttribute("books1") != null) {
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
                    ArrayList<Book> books = (ArrayList<Book>) request.getSession().getAttribute("books1");
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
                    request.getSession().removeAttribute("books1");
                %>

            </table>

            <%
                }
            %>

            <%
                if (request.getSession().getAttribute("searchBookError") != null) {
                    String searchBookError = (String) request.getSession().getAttribute("searchBookError");
            %>

            <script>document.getElementById('id05').style.display = 'block';</script>
            <span id="id5" style="color: red"><%=searchBookError%></span>

            <%
                    request.getSession().removeAttribute("searchBookError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="Reset('attribute1'); document.getElementById('id05').style.display='none'; document.getElementById('id5').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="searchBook" style="width:auto;">Search</button>
            </div>

        </div>
    </form>

</div>

<div id="id06" class="modal1">

    <span onclick="document.getElementById('id06').style.display='none'; document.getElementById('id6').innerHTML=''"
          class="close1" title="Close Users List">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Users List</h1>
            <hr>

            <label><b>Choose User Type:</b></label>
            <label>
                <select name="userType">
                    <option value="librarian">Librarian</option>
                    <option value="staff">Staff</option>
                    <option value="student">Student</option>
                </select>
            </label>

            <%
                if (request.getSession().getAttribute("users") != null) {
            %>

            <script>document.getElementById('id06').style.display = 'block';</script>

            <table id="id6" class="usersList">

                <tr>
                    <th>Username</th>
                    <th>Password</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Id</th>

                    <%
                        if (Objects.equals(request.getSession().getAttribute("userType"), "staff")) {
                    %>

                    <th>Department Name</th>

                    <%
                    } else if (Objects.equals(request.getSession().getAttribute("userType"), "student")) {
                    %>

                    <th>Class Name</th>

                    <%
                        }
                    %>

                </tr>

                <%
                    if (Objects.equals(request.getSession().getAttribute("userType"), "librarian")) {
                        ArrayList<Librarian> librarians = (ArrayList<Librarian>) request.getSession().getAttribute("users");
                        for (Librarian user : librarians) {
                %>

                <tr>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                </tr>

                <%
                    }
                } else if (Objects.equals(request.getSession().getAttribute("userType"), "staff")) {
                    ArrayList<Staff> staffs = (ArrayList<Staff>) request.getSession().getAttribute("users");
                    for (Staff user : staffs) {
                %>

                <tr>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                    <td><%=user.getDeptName()%>
                    </td>
                </tr>

                <%
                    }
                } else if (Objects.equals(request.getSession().getAttribute("userType"), "student")) {
                    ArrayList<Student> students = (ArrayList<Student>) request.getSession().getAttribute("users");
                    for (Student user : students) {
                %>

                <tr>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                    <td><%=user.getClassName()%>
                    </td>
                </tr>

                <%
                        }
                    } else {
                        request.getSession().removeAttribute("userType");
                    }
                    request.getSession().removeAttribute("users");
                %>

            </table>

            <%
            } else if (request.getSession().getAttribute("usersListError") != null) {
                String usersListError = (String) request.getSession().getAttribute("usersListError");
            %>

            <script>document.getElementById('id06').style.display = 'block';</script>

            <br>

            <span id="id6" style="color: red"><%=usersListError%></span>

            <%
                    request.getSession().removeAttribute("usersListError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id06').style.display='none'; document.getElementById('id6').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="listUsers" style="width:auto;">Show</button>
            </div>

        </div>
    </form>

</div>

<div id="id07" class="modal1">

    <span onclick="document.getElementById('id07').style.display='none'; document.getElementById('id7').innerHTML=''"
          class="close1" title="Close Update Librarian">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Update Librarian</h1>
            <p>Please fill in this form to update a librarian by ID.</p>
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

            <br>

            <label><b>Last Name</b></label>
            <label>
                <input type="text" placeholder="Enter Last Name" name="lastName" required>
            </label>

            <label><b>ID</b></label>
            <label>
                <input type="number" placeholder="Enter ID" name="id" required>
            </label>

            <br>

            <%
                if (request.getSession().getAttribute("updateError1") != null) {
                    String updateError = (String) request.getSession().getAttribute("updateError1");
            %>

            <script>document.getElementById('id07').style.display = 'block';</script>

            <%
                if (Objects.equals(updateError, "Librarian updated.")) {
            %>

            <span id="id7" style="color: green"><%=updateError%></span>

            <%
            } else {
            %>

            <span id="id7" style="color: red"><%=updateError%></span>

            <%
                    }
                    request.getSession().removeAttribute("updateError1");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id07').style.display='none';document.getElementById('id7').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="updateLibrarian" style="width:auto;">Update
                </button>
            </div>

        </div>
    </form>

</div>

<div id="id08" class="modal1">

    <span onclick="document.getElementById('id08').style.display='none'; document.getElementById('id8').innerHTML=''"
          class="close1" title="Close Delete User">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Delete User</h1>
            <p>Please fill in this form to delete a user by ID.</p>
            <hr>

            <label><b>Choose User Type:</b></label>
            <label>
                <select id="userType1" name="userType" onchange="document.getElementById('id').style.display='block';">
                    <option></option>
                    <option value="librarian">Librarian</option>
                    <option value="staff">Staff</option>
                    <option value="student">Student</option>
                </select>
            </label>

            <br>

            <div id="id" style="display: none">
                <label><b>ID</b></label>
                <label>
                    <input type="number" placeholder="Enter ID" name="id" required>
                </label>
            </div>

            <br>

            <%
                if (request.getSession().getAttribute("deleteError1") != null) {
                    String deleteError = (String) request.getSession().getAttribute("deleteError1");
            %>

            <script>document.getElementById('id08').style.display = 'block';</script>

            <%
                if (Objects.equals(deleteError, "User deleted.")) {
            %>

            <span id="id8" style="color: green"><%=deleteError%></span>

            <%
            } else {
            %>

            <span id="id8" style="color: red"><%=deleteError%></span>

            <%
                    }
                    request.getSession().removeAttribute("deleteError1");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="document.getElementById('id08').style.display='none'; document.getElementById('id8').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="deleteUser" style="width:auto;">Delete</button>
            </div>

        </div>
    </form>

</div>

<div id="id09" class="modal1">

    <span onclick="Reset('userType'); Reset('attribute2'); document.getElementById('id09').style.display='none'; document.getElementById('id9').innerHTML='';"
          class="close1" title="Close Search User">&times;</span>

    <form class="modal1-content" action="librarian" method="get">
        <div class="container1">

            <h1>Search User</h1>
            <p>Please fill in this form to Search Users by chosen attribute.</p>
            <hr>

            <label><b>Choose User Type:</b></label>
            <label>
                <select id="userType" name="userType" onchange="Reset('attribute2'); showSelect(this)">
                    <option></option>
                    <option value="librarian">Librarian</option>
                    <option value="staff">Staff</option>
                    <option value="student">Student</option>
                </select>
            </label>

            <div id="attribute" style="display: none">
                <label><b>Choose your search attribute:</b></label>
                <label>
                    <select id="attribute2" name="attribute" onchange="userSearchItems(this)">
                        <option></option>
                        <option value="username">Username</option>
                        <option value="firstName">First Name</option>
                        <option value="lastName">Last Name</option>
                        <option value="id">Id</option>
                        <option value="deptName" id="deptName" style="display: none">Department Name</option>
                        <option value="className" id="className" style="display: none">Class Name</option>
                    </select>
                </label>
            </div>

            <div id="results1"></div>

            <%
                if (request.getSession().getAttribute("users1") != null) {
            %>

            <script>document.getElementById('id09').style.display = 'block';</script>

            <table id="id9" class="usersList">

                <tr>
                    <th>Username</th>
                    <th>Password</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Id</th>

                    <%
                        if (Objects.equals(request.getSession().getAttribute("userType"), "staff")) {
                    %>

                    <th>Department Name</th>

                    <%
                    } else if (Objects.equals(request.getSession().getAttribute("userType"), "student")) {
                    %>

                    <th>Class Name</th>

                    <%
                        }
                    %>

                </tr>

                <%
                    if (Objects.equals(request.getSession().getAttribute("userType"), "librarian")) {
                        ArrayList<Librarian> librarians = (ArrayList<Librarian>) request.getSession().getAttribute("users1");
                        for (Librarian user : librarians) {
                %>

                <tr>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                </tr>

                <%
                    }
                } else if (Objects.equals(request.getSession().getAttribute("userType"), "staff")) {
                    ArrayList<Staff> staffs = (ArrayList<Staff>) request.getSession().getAttribute("users1");
                    for (Staff user : staffs) {
                %>

                <tr>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                    <td><%=user.getDeptName()%>
                    </td>
                </tr>

                <%
                    }
                } else if (Objects.equals(request.getSession().getAttribute("userType"), "student")) {
                    ArrayList<Student> students = (ArrayList<Student>) request.getSession().getAttribute("users1");
                    for (Student user : students) {
                %>

                <tr>
                    <td><%=user.getUsername()%>
                    </td>
                    <td><%=user.getPassword()%>
                    </td>
                    <td><%=user.getFirstName()%>
                    </td>
                    <td><%=user.getLastName()%>
                    </td>
                    <td><%=user.getId()%>
                    </td>
                    <td><%=user.getClassName()%>
                    </td>
                </tr>

                <%
                        }
                    } else {
                        request.getSession().removeAttribute("userType");
                    }
                    request.getSession().removeAttribute("users1");
                %>

            </table>

            <%
            } else if (request.getSession().getAttribute("searchUserError") != null) {
                String searchUserError = (String) request.getSession().getAttribute("searchUserError");
            %>

            <script>document.getElementById('id09').style.display = 'block';</script>
            <span id="id9" style="color: red"><%=searchUserError%></span>

            <%
                    request.getSession().removeAttribute("searchUserError");
                }
            %>

            <div class="clearfix1">
                <button type="button" class="cancel"
                        onclick="Reset('userType'); Reset('attribute2'); document.getElementById('id09').style.display='none'; document.getElementById('id9').innerHTML=''"
                        style="width:auto;">Cancel
                </button>
                <button type="submit" class="enter" name="button" value="searchUser" style="width:auto;">Search</button>
            </div>

        </div>
    </form>

</div>

<script>

    function Reset(eid) {
        const dropDown = document.getElementById(eid);
        dropDown.selectedIndex = 0;
        switch (eid) {
            case "attribute1":
                document.getElementById('results').style.display = 'none';
                break;
            case "userType":
                document.getElementById('results1').style.display = 'none';
                document.getElementById('attribute').style.display = 'none';
                break;
            case "attribute2":
                document.getElementById('results1').style.display = 'none';
                break;
        }
    }

    function showSelect(_this) {
        const item = _this.value;
        document.getElementById('attribute').style.display = 'block';
        switch (item) {
            case "librarian":
                document.getElementById('deptName').style.display = 'none';
                document.getElementById('className').style.display = 'none';
                break;
            case "staff":
                document.getElementById('deptName').style.display = 'block';
                document.getElementById('className').style.display = 'none';
                break;
            case "student":
                document.getElementById('deptName').style.display = 'none';
                document.getElementById('className').style.display = 'block';
                break;
        }
    }

    function userSearchItems(_this) {
        const item = _this.value; //get the value
        const results = document.querySelector('#results1'); //append results
        results.innerHTML = '' //clear the results on each update
        const input = document.createElement("input"); //create input
        const label = document.createElement("label"); //create label
        const b = document.createElement("B");
        let t = null;
        switch (item) {
            case "username":
                t = document.createTextNode("Username");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter Username"; //add a placeholder
                input.name = "username"; // set the CSS class
                break;
            case "firstName":
                t = document.createTextNode("First Name");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter First Name"; //add a placeholder
                input.name = "firstName"; // set the CSS class
                break;
            case "lastName":
                t = document.createTextNode("Last Name");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter Last Name"; //add a placeholder
                input.name = "lastName"; // set the CSS class
                break;
            case "id":
                t = document.createTextNode("Id");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "number";
                input.placeholder = "Enter Id"; //add a placeholder
                input.name = "id"; // set the CSS class
                break;
            case "deptName":
                t = document.createTextNode("Department Name");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter Department Name"; //add a placeholder
                input.name = "deptName"; // set the CSS class
                break;
            case "className":
                t = document.createTextNode("Class Name");
                b.appendChild(t)
                label.appendChild(b)
                input.type = "text";
                input.placeholder = "Enter Class Name"; //add a placeholder
                input.name = "className"; // set the CSS class
                break;
        }
        if (item !== "") {
            results.appendChild(label); //append label
            results.appendChild(document.createElement("br"));
            results.appendChild(input); //append input
            results.appendChild(document.createElement("br"));
            document.getElementById('results1').style.display = 'block';
        }
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
