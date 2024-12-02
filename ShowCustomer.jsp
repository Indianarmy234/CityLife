<%-- 
    Document   : ShowCustomer
    Created on : Jun 18, 2019, 8:08:50 PM
    Author     : dell
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bus Reservation System</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    </head>
    <body>
       <div class="container">
       <div class="row">
           <div class="col-lg-11 offset-1 jumbotron ">
               <h1 class="text-primary align-content-center">Bus Reservation System</h1>
           </div>
       </div>       
       <div class="row">
           <div class="col-lg-11 offset-1">                    
              <ul class="nav nav-pills nav-fill">                  
               <li class="nav-item">
                    <a class="nav-link" href="Home.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="NewBus.jsp">Bus</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Customer.jsp">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="BookBus.jsp">Booking</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Contact.jsp">Contact</a>
                </li>
            </ul>                       
               </div>
           </div>
           <div class="row">
               <div class="col-lg-11 offset-1 jumbotron">
                    <%
                         
        Connection c1 = null;
        Statement st = null;
        ResultSet rs1;
        String q="";
   
    try
    {
        
              Class.forName("com.mysql.jdbc.Driver").newInstance();
             c1=DriverManager.getConnection("jdbc:mysql://localhost/bus","root","root");
           
             st = c1.createStatement();
             q="select * from cust";
             rs1=st.executeQuery(q);
             out.println("<table>");
              out.println("<tr><th>Id</th><th>Name</th><th>Date Of Birth</th><th>Gender</th><th>Mobile</th><th>Email</th><th>Address</th></tr>");
             while(rs1.next())
             {
                 int id=rs1.getInt("c_id");
                 String name=rs1.getString("name");
                 String dob=rs1.getString("dob");  
                 String gen=rs1.getString("gen");  
                 String mob=rs1.getString("mob");  
                 String email=rs1.getString("email");
                 String addr=rs1.getString("addr");  
                 out.println("<tr><td>" + id + "</td> <td>" + name + "</td><td>" + dob + "</td><td>" + gen + "</td> <td>" + mob + "</td> <td>" + email + "</td> <td>" + addr + "</td></tr>");
             } 
              }
             catch(Exception e)
             {
                   out.print(e);
             }
            
   %>
           </div>
           </div>        
    </body>
</html>
