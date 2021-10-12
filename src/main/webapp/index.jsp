<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>

<head>
    <title>LMS</title>
</head>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    * {
        box-sizing: border-box;
    }

    /* Full-width input fields */
    input[type=text], input[type=email], input[type=password], select {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

    /* Add a background color when the inputs get focus */
    input[type=text]:focus, input[type=password]:focus, select:focus {
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

    /* Add padding to container elements */
    .container {
        padding: 16px;
    }

    /* The Modal (background) */
    .signup, .login {
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
    .signup-content, .login-content {
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
    .close {
        position: absolute;
        right: 35px;
        top: 15px;
        font-size: 40px;
        font-weight: bold;
        color: #f1f1f1;
    }

    .close:hover, .close:focus {
        color: #f44336;
        cursor: pointer;
    }

    /* Clear floats */
    .clearfix::after {
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
</style>

<body>

<div style="text-align: center;">
    <h2>Library Management System</h2>
    <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Sign Up</button>
    <button onclick="document.getElementById('id02').style.display='block'" style="width:auto;">Login</button>
</div>

<div id="id01" class="signup">

    <span onclick="Reset('role1'); document.getElementById('id01').style.display='none'; document.getElementById('id1').innerHTML='';"
          class="close" title="Close Sign Up">&times;</span>

    <form class="signup-content" action="signup" method="get">
        <div class="container">

            <h1>Sign Up</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>

            <label><b>First Name</b></label>
            <label>
                <input type="text" placeholder="Enter First Name" name="firstName" required>
            </label>

            <label><b>Last Name</b></label>
            <label>
                <input type="text" placeholder="Enter Last Name" name="lastName" required>
            </label>

            <label><b>Email</b></label>
            <label>
                <input type="email" placeholder="Enter Email" name="email" required>
            </label>

            <label><b>Password</b></label>
            <label>
                <input type="password" placeholder="Enter Password" name="password" id="psw" required>
            </label>

            <label><b>Repeat Password</b></label>
            <label>
                <input type="password" placeholder="Repeat Password" name="password-repeat" id="psw-repeat"
                       onkeyup='check();' required>
                <span id='message1'></span><br><br>
            </label>

            <label><b>Choose your role:</b></label>
            <label>
                <select id="role1" name="role" onchange="updateItems(this)">
                    <option value="librarian">Librarian</option>
                    <option value="staff">Staff</option>
                    <option value="student">Student</option>
                </select>
            </label>

            <%
                if (request.getSession().getAttribute("signupError") != null) {
                    String signupError = (String) request.getSession().getAttribute("signupError");
            %>

            <script>document.getElementById('id01').style.display = 'block';</script>

            <%
                if (Objects.equals(signupError, "User added.")) {
            %>

            <span id="id1" style="color: green"><%=signupError%></span>

            <%
            } else {
            %>

            <span id="id1" style="color: red"><%=signupError%></span>

            <%
                    }
                    request.getSession().removeAttribute("signupError");
                }
            %>

            <br>
            <br>
            <div id="results"></div>

            <div class="clearfix">
                <button type="button" class="cancel"
                        onclick="Reset('role1'); document.getElementById('id01').style.display='none'; document.getElementById('id1').innerHTML='';">
                    Cancel
                </button>
                <button type="submit" class="enter">Sign Up</button>
            </div>
        </div>
    </form>
</div>

<div id="id02" class="login">

    <span onclick="Reset('role'); document.getElementById('id02').style.display='none'; document.getElementById('id2').innerHTML=''"
          class="close" title="Close Login">&times;</span>

    <form class="login-content" action="login" method="get">
        <div class="container">

            <h1>Login</h1>
            <p>Please fill in this form to login.</p>
            <hr>

            <label><b>Email</b></label>
            <label>
                <input type="email" placeholder="Enter Email" name="email" required>
            </label>

            <label><b>Password</b></label>
            <label>
                <input type="password" placeholder="Enter Password" name="password" required>
            </label>

            <label><b>Choose your role:</b></label>
            <label>
                <select id="role" name="role">
                    <option value="librarian">Librarian</option>
                    <option value="staff">Staff</option>
                    <option value="student">Student</option>
                </select>
            </label>

            <%
                if (request.getSession().getAttribute("loginError") != null) {
                    String loginError = (String) request.getSession().getAttribute("loginError");
            %>

            <script>document.getElementById('id02').style.display = 'block';</script>
            <span id="id2" style="color: #f44336"><%=loginError%></span>

            <%
                    request.getSession().removeAttribute("loginError");
                }
            %>

            <div class="clearfix">
                <button type="button" class="cancel"
                        onclick="Reset('role'); document.getElementById('id02').style.display='none'; document.getElementById('id2').innerHTML='';">
                    Cancel
                </button>
                <button type="submit" class="enter">Login</button>
            </div>

        </div>
    </form>

</div>

<script>

    function Reset(eid) {
        const dropDown = document.getElementById(eid);
        dropDown.selectedIndex = 0;
        if (eid === "role1") {
            document.getElementById('results').style.display = 'none';
        }
    }

    const check = function () {
        if (document.getElementById('psw').value === document.getElementById('psw-repeat').value) {
            document.getElementById('message1').style.color = 'green';
            document.getElementById('message1').innerHTML = 'matching';
            document.getElementById('submit').disabled = false;
        } else {
            document.getElementById('message1').style.color = 'red';
            document.getElementById('message1').innerHTML = 'not matching';
            document.getElementById('submit').disabled = true;
        }
    };

    function updateItems(_this) {
        const item = _this.value; //get the value
        const results = document.querySelector('#results'); //append results
        results.innerHTML = '' //clear the results on each update
        const input = document.createElement("input"); //create input
        const label = document.createElement("label"); //create label
        const b = document.createElement("B");
        if (item === "staff") {
            const t = document.createTextNode("Department Name");
            b.appendChild(t)
            label.appendChild(b)
            input.type = "text";
            input.placeholder = "Enter Department Name"; //add a placeholder
            input.name = "deptName"; // set the CSS class
            results.appendChild(label); //append label
            results.appendChild(document.createElement("br"));
            results.appendChild(input); //append input
            results.appendChild(document.createElement("br"));
            document.getElementById('results').style.display = 'block';
        } else if (item === "student") {
            const t = document.createTextNode("Class Name");
            b.appendChild(t)
            label.appendChild(b)
            input.type = "text";
            input.placeholder = "Enter Class Name"; //add a placeholder
            input.name = "className"; // set the CSS class
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
