
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
		<?php
		$fname = "";
		$uname = "";
		$email = "";
		$add="";
		$dob="";
		$gender="";

		$fnameErr = $unameErr = $emailErr = $genderErr = $addErr = $dobErr = $upassErr = $cupassErr = $iagreeErr = "";

		if (isset($_POST['register'])) {

			// Name Validation
			if (empty($_POST['fname'])) {
				$fnameErr = "Name is required";
			}
			else{
				$add = input_data($_POST['fname']);
				// check if name only contains letters and whitespace  
				if (!preg_match("/^[a-zA-Z ]*$/",$fname)) {  
					$fnameErr = "Only alphabets and white space are allowed";  
				} 
			} 
				if (empty($_POST['add'])) {
					$addErr = "Address is required";
				}
				else{
					$add = input_data($_POST['add']);
					// check if name only contains letters and whitespace  
					if (!preg_match("/^[a-zA-Z ]*$/",$add)) {  
						$addErr = "Only alphabets and white space are allowed";  
					} 
		
				}
				 # Validate Date of Birth
				 if (empty($_POST["dob"])) {  
					$dobErr = "Date of Birth is required";  
			        } 
					else {  
						$dob = input_data($_POST["dob"]);  
						// check if  dob  is well-formed  
						if (!preg_match ("/^[0-9]*$/", $dob) ) {  
						$dobErr = "Only numeric value is allowed.";  
						} 
					} 
				//Password Validation
				$upass = $_POST['upass'];
				if(empty($upass)){
					$upassErr = "Password is required.";
				}
					//Email Validation   
			if(empty($_POST["email"])) {  
				$emailErr = "Email is required";  
			}
			else{  
				$email = input_data($_POST["email"]);  
				// check that the e-mail address is well-formed  
				if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {  
					$emailErr = "Invalid email format";  
				}  
			}
			//Age Range Validation
			$gender = $_POST['gender'];
			if(empty($gender)){
				$genderErr = "Gender is not selected.";
			}
	
				$cupass = $_POST['cupass'];
				if(empty($cupass)){
					$cupassErr = "Confirm Password is required.";
				}
				
				//checking if confirm password and password is same or not.
				if($upass != $cupass){
					$cupassErr = "Its not same as password.";
				}
		}
	

		function input_data($data) {  
			$data = trim($data);  
			$data = stripslashes($data);  
			$data = htmlspecialchars($data);  
			return $data;  
		}

			
		?>
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
				<form method="post" action="">
					<div class="input-field">
						<span><?php echo $fnameErr ?></span>
						<input type="text" name="fname" placeholder="Full Name" class="input" value="<?php echo $fname ?>">
					</div>
					<div class="input-field">
						<span><?php echo $emailErr ?></span>
						<input type="text" name="email" placeholder="Email Address" class="input" value="<?php echo $email ?>">
					</div>
					<div class="input-field">
						<span><?php echo $addErr ?></span>
						<input type="text" name="add" placeholder="Address" class="input" value="<?php echo $add ?>">
					</div>
					<div class="input-field">
					<span><?php echo $dobErr ?></span>
                            <input type="text" class="input" name="dob" placeholder="Date of Birth" value="<?php echo $add ?>">
                        </div>
					<div class="input-field">
						<span><?php echo $genderErr."<br/>" ?></span>
						<select name="gender" id="" class="input">
							<option value="" selected>Gender</option>
							<option value="child">Male</option>
							<option value="adult">Female</option>
							<option value="elder">Other</option>
						</select>	
					</div>
					<div class="input-field">
						<span><?php echo $upassErr ?></span>
						<input type="password" name="upass" placeholder="Password" class="input">
					</div>
					<div class="input-field">
						<span><?php echo $cupassErr ?></span>
						<input type="password" name="cupass" placeholder="Confirm Password" class="input">
					</div>
					<div class="form-wrapper">
                            <input type="checkbox" name="agree"> I accept the
                            <a href="#"> Terms of Uses</a> &amp;
                            <a href="#"> Privacy Policy</a>
                        </div><br>
					
					<button name="register">Register
					</button><br/>
					<div class="signin">
                            <span>Already have an account? <a href="ll.html">Register</a></span>
                        </div>
					
				
				</form>
			</div>
		</div>
</html>
