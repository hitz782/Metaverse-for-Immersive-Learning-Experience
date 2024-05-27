<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.DriverManager, java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>User History</title>
        <style>
            body {
                background: linear-gradient(to right, rgb(13, 249, 206), rgb(95, 16, 216));
                color: black;
            }
            .history-container {
                margin: 20px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: rgba(255, 255, 255, 0.5);
                max-width: 600px;
            }
            .history-entry {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-bottom: 20px;
                /*                background-color: rgba(200, 200, 200, 0.8); Light grey background */
                transition: background-color 0.3s; /* Smooth transition */

            }
            .history-entry:hover {
                background-color: rgba(255, 255, 240, 0.45); /* Creamy white with reduced opacity */
                transition: background-color 0.3s; /* Smooth transition */
            }

            .history-date {
                font-weight: bold;
                text-align: center;
                margin-bottom: 20px;
            }
            .history-items {
                text-align: left;
            }
            .history-item {
                margin-bottom: 15px;
            }
            .topic-name {
                font-weight: bold;
                color: #333;
            }
            .timestamp {
                color: #666;
                font-size: 0.8em;
                margin-right: 20px;
            }
        </style>
    </head>
    <body>
        <div class="history-container">
            <h2><center>User History</center></h2>
                    <%
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        try {
                            String userIdstr = request.getParameter("userId");
                            int userId = Integer.parseInt(userIdstr);
                            Class.forName("com.mysql.jdbc.Driver");
                            String connectionString = "jdbc:mysql://localhost/eduverse";
                            String username = "root";
                            String password = "root@123";
                            conn = DriverManager.getConnection(connectionString, username, password);

                            String historyQuery = "SELECT h.ViewedDateTime, t.TopicName FROM history h "
                                    + "INNER JOIN topic t ON h.TopicID = t.TopicID "
                                    + "WHERE h.UserID = ? "
                                    + "ORDER BY h.ViewedDateTime DESC";
                            pstmt = conn.prepareStatement(historyQuery);
                            pstmt.setInt(1, userId);
                            rs = pstmt.executeQuery();

                            Map<String, List<String[]>> historyMap = new LinkedHashMap<>();

                            while (rs.next()) {
                                String timestamp = rs.getString("ViewedDateTime");
                                String date = timestamp.substring(0, 10);
                                String topicName = rs.getString("TopicName");

                                if (!historyMap.containsKey(date)) {
                                    historyMap.put(date, new ArrayList<String[]>());
                                }
                                historyMap.get(date).add(new String[]{timestamp, topicName});
                            }

                            for (Map.Entry<String, List<String[]>> entry : historyMap.entrySet()) {
                                String date = entry.getKey();
                                List<String[]> entries = entry.getValue();
                    %>
            <div class="history-date"><%= date%></div>
            <hr>
            <div class="history-items">
                <% for (String[] historyEntry : entries) {%>
                <div class="history-entry">
                    <span class="timestamp"><%= historyEntry[0].substring(11)%></span>
                    <span class="topic-name"><%= historyEntry[1]%></span>
                </div>
                <% } %>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </body>
</html>
