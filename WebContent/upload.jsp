<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.amazonaws.*" %>
<%@ page import="com.amazonaws.auth.*" %>
<%@ page import="com.amazonaws.services.ec2.*" %>
<%@ page import="com.amazonaws.services.ec2.model.*" %>
<%@ page import="com.amazonaws.services.s3.*" %>
<%@ page import="com.amazonaws.services.s3.model.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.*" %>
<%@ page import="com.amazonaws.services.dynamodbv2.model.*" %>

<script src="https://sdk.amazonaws.com/js/aws-sdk-2.1.23.min.js"></script>

<script type="text/javascript">
  // See the Configuring section to configure credentials in the SDK
  AWS.config.credentials = new AWS.CognitoIdentityCredentials({
    IdentityPoolId: "us-east-1:ce945b36-68e3-4d0e-a083-66b496c8eb5f",
  });
  // Configure your region
  AWS.config.region = 'us-east-1';
</script>


<% //Init in = new Init(); 
	//AmazonDynamoDB dynamo = new AmazonDynamoDBClient(credentialsProvider);
%>
<script>
function upload(){
	var db = new AWS.DynamoDB();
	db.listTables(function(err, data) {
	  console.log(data.TableNames);
	});
	var table = new AWS.DynamoDB({params: {TableName: 'ShareNote'}});
	var key = 'Angie';

	table.getItem({Key: {docId: {S: key}}}, function(err, data) {
    console.log(data.Item); // print the item data
	});
	
	key = 'Yaya';
	var itemParams = {Item: {docId: {S: key}, data: {S: 'data'}}};
	table.putItem(itemParams, function() {
	  // Read the item from the table
	  table.getItem({Key: {docId: {S: key}}}, function(err, data) {
	    console.log(data.Item); // print the item data
	  });
	});
}
</script>
<button onclick="upload()"> upload </button>