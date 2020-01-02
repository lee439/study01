<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="org.json.simple.*" %>

<%

StringBuffer jsonBuffer = new StringBuffer();
JSONObject jsonObject = null;
String json = null;
String line = null;
try {
    BufferedReader reader = request.getReader();
   
    while((line = reader.readLine()) != null) {
        jsonBuffer.append(line);
    }
    json = jsonBuffer.toString();   
    System.out.println(json);
    
    
    JSONObject jobj = (JSONObject) JSONValue.parse(json);
    System.out.println(jobj.get("type"));
    System.out.println(jobj.get("id"));
    System.out.println(jobj.get("pw"));
    
    if(jobj.get("id").equals("test") && jobj.get("pw").equals("123")) {
        out.print(json);
      }

   
}catch(Exception e) {
    System.out.println("Error reading JSON string: " + e.toString());
}  
   %>
