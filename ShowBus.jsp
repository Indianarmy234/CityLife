<%-- 
    Document   : ShowBus
    Created on : Jun 18, 2019, 8:08:32 PM
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
                    <a class="nav-link active" href="NewBus.jsp">Bus</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Customer.jsp">Customer</a>
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
             q="select * from nbus";
             rs1=st.executeQuery(q);
             out.println("<table>");
              out.println("<tr><th>Id</th><th>Bus Type</th><th>Total Seats</th></tr>");
             while(rs1.next())
             {
                 int id=rs1.getInt("id");
                 String bus_type=rs1.getString("bus_type");
                 String tot_seats=rs1.getString("tot_seats");                 
                 out.println("<tr><td>"+id+"</td><td>"+bus_type+"</td><td>"+tot_seats+"</td></tr>");
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
