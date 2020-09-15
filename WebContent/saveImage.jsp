<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
      Connection conn=null;
      Class.forName("com.mysql.jdbc.Driver").newInstance();
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/image","root", "rootroot");

      PreparedStatement psImageInsertDatabase=null;

      byte[] b=null;
      try{
         String sqlImageInsertDatabase="insert into upload_image (bImage) values(?)";
         psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);

         DiskFileItemFactory factory = new DiskFileItemFactory();

         ServletFileUpload sfu = new ServletFileUpload(factory);
         List items = sfu.parseRequest(request);

         Iterator iter = items.iterator();

         while (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            if (!item.isFormField()) {
                 b = item.get();
             }
         }

         psImageInsertDatabase.setBytes(1,b);
         psImageInsertDatabase.executeUpdate();
      }
      catch(Exception e)
      {
        e.printStackTrace();
        response.sendRedirect("addimage.jsp");
      }

%>
<a href="uploadimage.jsp">[업로드]</a>