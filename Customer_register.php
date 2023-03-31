<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="register1.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <title>Register</title>
</head>
<body>


    <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-md-6 side-image">
                    <!-------Image-------->
                    <img src="images/white.png" alt="">
                    <div class="text">
                        <p>Huddersfax Pantry  <br><i>-Enjoy shopping</i></p>
                    </div>
                </div>
                <div class="col-md-6 right">
                     <div class="input-box">
                        <h1>Register</h1>

                             <div class="input-field">
                        
                            <input type="text" class="input" name="fname" required >
                            <label for="fname">Full name</label>
                        </div>
                      
                        <div class="input-field">
                            <input type="text" class="input" id="email" required autocomplete="off">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field">
                            <input type="text" class="input" id="dob" required>
                            <label for="dob">Date of Birth</label>
                        </div>
                        <div class="input-field">
                            <input type="password" class="input" id="password" required>
                            <label for="password">Address</label>
                        </div>
                        <div class="input-field">
                            <select name="gender" id="" class = "input">
                                <option value="" selected>Gender</option>
                                <option value="child">Male</option>
                                <option value="adult">Female</option>
                                <option value="elder">Other</option>
                            </select>	
                        </div>
            
                        <div class="input-field">
                            <input type="password" class="input" id="password" required>
                            <label for="password">Password</label>
                        </div>
                        
                        <div class="input-field">
                            <input type="password" class="input" id="password" required>
                            <label for="password">Confirm Password</label>
                        </div>
                        <div class="form-wrapper">
                            <input type="checkbox" name="agree"> I accept the
                            <a href="#"> Terms of Uses</a> &amp;
                            <a href="#"> Privacy Policy</a>
                        </div><br>
                        <div class="input-field">
                            <input type="submit" class="submit" value="Sign In" name="register">
                            
                        </div>
                        <div class="signin">
                            <span>Already have an account? <a href="Customerlogin.php">Login</a></span>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>