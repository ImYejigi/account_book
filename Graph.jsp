<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sorce.CAL_TYPE_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그래프</title>
</head>
<body>	
<%
		CAL_TYPE_DAO cal_type = new CAL_TYPE_DAO();
		HashMap<String, ArrayList<String>> map = cal_type.Graph("test");
		
		ArrayList<String> cal_type_name = new ArrayList<>();
		ArrayList<String> cal_type_count = new ArrayList<>();
		
		for(Entry<String, ArrayList<String>> elem : map.entrySet()){
			if("cal_type_name".equals(elem.getKey())){
				cal_type_name = elem.getValue();
			}
			
			if("cal_type_count".equals(elem.getKey())){
				cal_type_count = elem.getValue();
			}
        }
		System.out.println(cal_type_name);
%>
<div>
    <canvas id="myChart"></canvas>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>

<script src = "../js/Graph.js"></script>
</body>
</html>