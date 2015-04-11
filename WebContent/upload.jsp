<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.amazonaws.*" %>
<%@ page import="com.amazonaws.auth.*" %>
<%@ page import="com.amazonaws.services.ec2.*" %>
<%@ page import="com.amazonaws.services.ec2.model.*" %>
<%@ page import="com.amazonaws.services.s3.*" %>
<%@ page import="com.amazonaws.services.s3.model.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.model.*" %>


<% //Init in = new Init(); 
	//AmazonDynamoDB dynamo = new AmazonDynamoDBClient(credentialsProvider);
%>
<script>
function upload(){
	var table = new AWS.DynamoDB({params: {TableName: 'AsignmentData'}});
	var key = 'test';

	// Write the item to the table
	var itemParams = {Item: {id: {S: key}, data: {S: 'data'}}};
	table.putItem(itemParams, function() {
	  // Read the item from the table
	  table.getItem({Key: {id: {S: key}}}, function(err, data) {
	    console.log(data.Item); // print the item data
	  });
	});
}
</script>
<button onclick="upload()"> upload </button>