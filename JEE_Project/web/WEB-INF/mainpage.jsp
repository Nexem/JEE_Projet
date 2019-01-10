<%@page import="jee.model.EmployeeBean"%>
<%@page import="jee.model.DataAccess"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Employees</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<script  src = "https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" > </script>
	<script  src = "C:\wamp\www\site\bootstrap\dist\js\bootstrap.min.js" > </script>
    </head>
    <body>
        <table align="right">
            <th style="color:blue">Your session is active</th>
            <td>
                <form action="Controller" method="POST">
                    <button type="submit" name="action" class="btn btn-default" aria-label="Left Align" value="Goodbye">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </button>
                </form>
            </td>
        </table>
        <h1>List of employees</h1>
        <c:set var="empList" value='${sessionScope["employeesList"]}'/>
        <c:set var="msg" value='${sessionScope["message"]}'/>
        <c:if test="${empList eq null}">
            <h2 color="blue"><b>The club has no member</b></h2>
            </br>
            <form name="AddForm" action="Controller">
                <input value="Add" name="button" type="submit"/>
            </form>
        </c:if>
        <c:if test="${empList ne null}">
            <c:if test='${msg ne null}'>
                <c:out value="${msg}"/>
                <c:remove var="message" scope="session"/>
            </c:if>
                
            <form name="ListForm"  method ="GET" action="Controller">    
                <table style="width:98%; table-layout:fixed">
                    <tr>
                        <th style="width:3%">Sél</th>
                        <th align="center">NAME</th>
                        <th align="center">FIRST NAME</th>
                        <th align="center">HOME PHONE</th>
                        <th align="center">MOBILE PHONE</th>
                        <th align="center">WORK PHONE</th>
                        <th align="center">ADDRESS</th>
                        <th align="center">POSTAL CODE</th>
                        <th align="center">CITY</th>
                        <th align="center">EMAIL</th>
                    </tr>


                    <c:forEach items="${employeesList}" var="emp">
                        <tr>
                            <td align="center"><input type="radio" name="ID" value="${emp.ID}"/></td>
                            <td align="center"><c:out value="${emp.name}"/></td>
                            <td align="center"><c:out value="${emp.firstName}"/></td>
                            <td align="center"><c:out value="${emp.homePhone}"/></td>
                            <td align="center"><c:out value="${emp.mobilePhone}"/></td>
                            <td align="center"><c:out value="${emp.workPhone}"/></td>
                            <td align="center"><c:out value="${emp.address}"/></td>
                            <td align="center"><c:out value="${emp.postalCode}"/></td>
                            <td align="center"><c:out value="${emp.city}"/></td>
                            <td align="center"><c:out value="${emp.email}"/></td>

                        </tr>
                    </c:forEach>

                </table>
                </br>
            <table>
                <tr>
                    <input value="Delete" name="action" type="submit"/>
                    <input value="Details" name="action" type="submit"/>
                    <input value="Add" name="action" type="submit"/>
                </tr>
            </table>
                </form>
        </c:if>        
    </body>
</html>
