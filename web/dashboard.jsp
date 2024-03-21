<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 8px;
            }
            th {
                background-color: lightgray;
            }
        </style>
        <script>
            function showStudentInfo(studentName) {
                alert("Student Name: " + studentName);
            }
        </script>
    </head>
    <body>
        <h2>Welcome <%= request.getParameter("username")%>!</h2>
        <table>
            <tr>
                <th>Department</th>
                <th>Student ID</th>
                <th>Marks</th>
                <th>Pass %</th>
            </tr>
            <%-- Data dummy --%>
            <%
                String[][] data = {
                    {"Dep 1", "John Doe", "S1", "35"},
                    {"Dep 1", "Jane Smith", "S2", "70"},
                    {"Dep 1", "Alice Johnson", "S3", "60"},
                    {"Dep 1", "Bob Brown", "S4", "90"},
                    {"Dep 2", "Emily Wilson", "S5", "30"},
                    {"Dep 3", "Michael Lee", "S6", "32"},
                    {"Dep 3", "Olivia Martinez", "S7", "70"},
                    {"Dep 3", "William Taylor", "S8", "20"}
                };

                // Map untuk menyimpan jumlah mahasiswa dan jumlah mahasiswa lulus untuk setiap departemen
                java.util.Map<String, Integer> totalStudents = new java.util.HashMap<>();
                java.util.Map<String, Integer> passStudents = new java.util.HashMap<>();

                // Menghitung jumlah mahasiswa dan jumlah mahasiswa lulus untuk setiap departemen
                for (String[] row : data) {
                    String department = row[0];
                    int marks = Integer.parseInt(row[3]);

                    totalStudents.put(department, totalStudents.getOrDefault(department, 0) + 1);
                    if (marks >= 40) {
                        passStudents.put(department, passStudents.getOrDefault(department, 0) + 1);
                    }
                }

                // Menampilkan data dalam tabel
                List<String> sortedDepartments = new ArrayList<>(totalStudents.keySet());
                Collections.sort(sortedDepartments);

                for (String department : sortedDepartments) {
                    int total = totalStudents.get(department);
                    int pass = passStudents.getOrDefault(department, 0);
                    double passPercentage = total > 0 ? (double) pass / total * 100 : 0;

            %>
            <tr>
                <%                    boolean firstRow = true;
                    for (String[] row : data) {
                        if (row[0].equals(department)) {
                            if (!firstRow) {
                %><tr><%-- Tambahkan baris baru kecuali untuk baris pertama --%>
                <%}
                %>
                <%
                    if (firstRow) {
                %><td rowspan="<%= total%>"><%= department%></td><%-- Hanya tambahkan sel Departemen untuk baris pertama --%>
                <%
                    }
                %>
                <td><a href="#" onclick="showStudentInfo('<%= row[1]%>')"><%= row[2]%></a></td>
                <td><%= row[3]%></td>
                <% firstRow = false;
                        }
                    }
                %>
                <%
                    if (firstRow) {
                %><td rowspan="<%= total%>"><%= String.format("%.2f", passPercentage)%></td><%-- Hanya tambahkan sel Persentase Lulus untuk baris pertama --%>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>





