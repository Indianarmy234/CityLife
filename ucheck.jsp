<%-- 
    Document   : check
    Created on : Feb 2, 2018, 3:10:52 AM
    Author     : admin pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rasoi/title>
    </head>
    <body>
        <%
        
        String un,ps;
        un=request.getParameter("un");
        ps=request.getParameter("ps");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3307/citylife","root","root");
        PreparedStatement p=cn.prepareStatement("select * from rest where un=? and ps=?");
        p.setString(1,un);
        p.setString(2,ps);
        ResultSet i=p.executeQuery();
        while(i.next())
        {
            response.sendRedirect("index_1.jsp");
        }
        %>
         <div style="width:100%;background:red;color:white;text-align:center;font-size:24px;">
    <a href="http://www.manalsoftech.com" style="color:white;text-decoration:none;">copyright @rasoi...online food ordering system</a>
</div>
    </body>
</html>
