<%-- 
    Document   : douplimgfood
    Created on : Feb 12, 2018, 8:44:32 PM
    Author     : admin pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,pkg.*,java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%
	String fid=session.getAttribute("fid").toString();
        
	String saveFile="";
	String contentType=request.getContentType();
	if((contentType!=null)&&(contentType.indexOf("multipart/form-data")>=0))
	{
        DataInputStream in=new DataInputStream(request.getInputStream());
	int formDataLength=request.getContentLength();
	byte dataBytes[]=new byte[formDataLength];
	int byteRead=0;
	int totalBytesRead=0;
	while(totalBytesRead<formDataLength)
	{
		byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
		totalBytesRead+=byteRead;
        }
	String file=new String(dataBytes);
	saveFile=file.substring(file.indexOf("filename=\"")+10);
        saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
	saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
	int lastIndex=contentType.lastIndexOf("=");
	String boundary=contentType.substring(lastIndex+1,contentType.length());
        int pos;
        pos=file.indexOf("filename=\"");
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        pos=file.indexOf("\n",pos)+1;
        int boundaryLocation=file.indexOf(boundary,pos)-4;
        int startPos=((file.substring(0,pos)).getBytes()).length;
        int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
	File ff=new File("F:/Pro_2017_18/rasoi/web/img/"+saveFile);
	FileOutputStream fileOut=new FileOutputStream(ff);
        fileOut.write(dataBytes,startPos,(endPos-startPos));
        fileOut.flush();
        fileOut.close();
        
    %>
   
   <% 
        Connection con=null;
        PreparedStatement pst;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con=DriverManager.getConnection("jdbc:mysql://localhost/rasoi","root","");
            pst=con.prepareStatement("update food set fimg=? where fid=? ");
            String path="img/"+saveFile;
            pst.setString(1,path);
            pst.setString(2,fid);
            int m=pst.executeUpdate();
            if(m>0)
            {
            response.sendRedirect("food.jsp?x=Img Upload ");
            }
            else
            {
             out.println("error");   
            }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
   } %>
             <div style="width:100%;background:red;color:white;text-align:center;font-size:24px;">
    <a href="http://www.manalsoftech.com" style="color:white;text-decoration:none;">copyright @rasoi...online food ordering system</a>
</div>    
    </body>
</html>
