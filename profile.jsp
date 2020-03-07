<%@page import="javax.swing.ImageIcon"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@ page session="true" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@include file = "connection.jsp" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login_show</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">
    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    
   
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Mediplus</a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav nav ml-auto">
	          <li class="nav-item"><a href="#home-section" class="nav-link"><span>Home</span></a></li>
	          <li class="nav-item"><a href="#about-section" class="nav-link"><span>About</span></a></li>
	          <li class="nav-item"><a href="#department-section" class="nav-link"><span>Department</span></a></li>
	          <li class="nav-item"><a href="#doctor-section" class="nav-link"><span>Doctors</span></a></li>
	          <li class="nav-item"><a href="#blog-section" class="nav-link"><span>Blog</span></a></li>
	          <li class="nav-item"><a href="#contact-section" class="nav-link"><span>Contact</span></a></li>
	          <li class="nav-item cta mr-md-2"><a href="appointment.html" class="nav-link">Appointment</a></li>
                  <li class="nav-item cta mr-md-2"> <a href="logout.jsp" class="nav-link">Logout</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
            <br>
            <br>
       <br>
                        
        <br>
          		 


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
if(session.getAttribute("em") == null)
{
response.sendRedirect("login.html");
}

String id = request.getParameter("userid");
Statement statement = null;
ResultSet resultSet = null;
%>



<%
try{
String em = request.getParameter("email");
String pass = request.getParameter("password");
statement=connection.createStatement();
String sql ="select * from register where email='"+em+"'and password='"+pass+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

    <h3>Profile</h3>
  

<table>
    
    <div>
        <style>
div {
  
  padding-left: 10px;
}
</style>
          
		<div class="text pt-3 text-center">
                        <h3 class="mb-2"><%=resultSet.getString("fname")%>  <%=resultSet.getString("lname") %></h3>
                             <div class="faded">
                    
                                 <%=resultSet.getString("email") %><br>
                                 Age - <%=resultSet.getString("age") %><br>
                                 <%=resultSet.getString("mobile") %><br>
                                 <%=resultSet.getString("address") %><br>  
            
           
	<ul class="ftco-social text-center">
            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                     <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
		        <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
	 </ul>


                         

  <button id="show2" class="btn btn-primary">Update</button>
<style>
dialog{width:400px;}
</style>
<dialog id="dialog2">
  <form action="update.jsp" method="post" class="appointment-form ftco-animate" >
    <div class="container">
        <div class="">
            
<div class="form-group">
        <h6> First Name</h6>
        <input type="text" class="form-control" name="fname" value="<%=resultSet.getString("fname")%>" required autocomplete="off"><br>
</div>
<div class="form-group">
        <h6> Last Name</h6>
        <input type="text" class="form-control" name="lname" value="<%=resultSet.getString("lname")%>" required autocomplete="off"><br>
</div>
<div class="form-group">
        <h6> Age </h6>
        <input type="number" class="form-control" name="age" value="<%=resultSet.getString("age")%>" required autocomplete="off"><br>
</div>
<div class="form-group">
        <h6> Mobile Number </h6>
        <input type="number" class="form-control" name="mobile" value="<%=resultSet.getString("mobile")%>" required autocomplete="off"><br>
</div>
<div class="form-group">
        <h6> Address </h6>
        <input type="text" class="form-control" name="address" value="<%=resultSet.getString("address")%>" required autocomplete="off"><br>
</div>

                     <input type="hidden" name="email" value="<%=em%>">
                     <input type="hidden" name="password" value="<%=pass%>">
                     </div>
                 <input type="submit" class="btn btn-secondary py-3 px-4">
                  
                  </div>
         
               
    </input>
    </form>
     <button id="hide2"  class="btn btn-secondary py-3 px-4">Close </button>
</dialog>
                          
                       
             <button id="show3" class="btn btn-primary">Change Password</button>             


  <div class="col-md-5 d-flex">
	        	<div class="appointment-wrap bg-white p-5 d-flex align-items-center">
                            
<style>
dialog{width:500px;}
</style>
<div class="">
<dialog id="dialog3">
  <form action="changepassword.jsp" method="post" class="appointment-form ftco-animate" >
    <div class="container">
<div class="form-group">
        <h4> Current  password</h4>
        <input type="password" class="form-control" name="current"  placeholder="Current Password" required autocomplete="off"><br>
</div>
        <div class="form-group"
        <h4> New  Password</h4>
        <input type="password" class="form-control" name="new"  placeholder="New Password" required autocomplete="off"><br>
                     <input type="hidden" name="email" value="<%=em%>">
        </div>
                     <div class="form-group"
                     <h4> Confirm  password</h4>
                   <input type="password" class="form-control" name="confirm"  placeholder="Confirm Password" required autocomplete="off"><br>
                   
                   <input type="submit" class="btn btn-secondary py-3 px-4">
                  </div>
       
         
    </input>
    <button id="hide3"  class="btn btn-secondary py-3 px-4">Close </button>
</form></div></div>
        
</dialog>
<!-- "Show" button -->



<!-- JavaScript to provide the "Show/Close" functionality -->
<script type="text/JavaScript">
(function() {  
    var dialog3 = document.getElementById('dialog3');  
    document.getElementById('show3').onclick = function() {  
        dialog3.showModal();  
    };  
    document.getElementById('hide3').onclick = function() {  
        dialog3.close();  
    };  
})();
(function() {  
    var dialog2 = document.getElementById('dialog2');  
    document.getElementById('show2').onclick = function() {  
        dialog2.showModal();  
    };  
    document.getElementById('hide2').onclick = function() {  
        dialog2.close();  
    };  
})();
</script>
  
                                </div>
                            </div>
                        </div>
                     </div>

                        <%
                            
                                 
                 if(em !=null && em.length() !=0)
                     session.setAttribute("email",em);
                 else 
                     response.sendRedirect("login.html");
                     
                        
                        %>
                  
                         <%
                        if(session.getAttribute("email") !=null)
                 {
                    String sessionName = (String)session.getAttribute("email");
                   
                    %>
                     

                  <%          
                  }
                     
                   else 
                         response.sendRedirect("profile.jsp");
                         %>   

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

 </section>

 <br>
 <br>
 <br>
 
 <!-- footer_start  -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-3 ">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="img/footer_logo.png" alt="">
                                </a>
                            </div>
                            <p>5th flora, 700/D kings road, green <br> lane New York-1782 <br>
                                <a href="#">+10 367 826 2567</a> <br>
                                <a href="#">contact@carpenter.com</a>
                            </p>
                            <p>



                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-twitter-alt"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-pinterest"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-youtube-play"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4 offset-xl-1">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Useful Links
                            </h3>
                            <ul class="links">
                                <li><a href="#">Pricing</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#"> Gallery</a></li>
                                <li><a href="#"> Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Subscribe
                            </h3>
                            <form action="#" class="newsletter_form">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit">Subscribe</button>
                            </form>
                            <p class="newsletter_text">Esteem spirit temper too say adieus who direct esteem esteems
                                luckily.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer_end  -->

    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>



    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>


    <script src="js/main.js"></script>

</body>

</html>