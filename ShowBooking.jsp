<%-- 
    Document   : ShowBooking
    Created on : Jun 19, 2019, 12:08:25 AM
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
                    <a class="nav-link" href="Customer.jsp">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="BookBus.jsp">Booking</a>
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
             q="select * from boook";
             rs1=st.executeQuery(q);
             out.println("<table>");
              out.println("<tr><th> Id </th><th> Name </th><th> Mobile </th><th> Address </th><th> Passanger </th><th> From </th><th> To </th><th> Price </th></tr>");
             while(rs1.next())
             {
                 int id=rs1.getInt("bid");
                 String name=rs1.getString("c_name");
                 String mob=rs1.getString("mob");  
                 String addr=rs1.getString("addr");  
                 String pass=rs1.getString("pass");  
                 String from=rs1.getString("froms");
                 String to=rs1.getString("tod");
                 String price=rs1.getString("price");
                 out.println("<tr><td>" + id + "</td> <td>" + name + "</td><td>" + mob + "</td><td>" + addr + "</td> <td>" + pass + "</td> <td>" + from + "</td> <td>" + to + "</td><td>" + price + "</td></tr>");
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
