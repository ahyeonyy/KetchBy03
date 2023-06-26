<%@page import="com.ketchby.db.ConnectionProvider"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
.starArea {
    padding: 30px;
}
.star {
    display: inline-block;
    width: 50px;
    height: 50px;
    margin-right: 10px;
    background-image: url('http://hwangsunsoo.com/customer/tripcody/images/icon-shopping-star-big-gray.svg');
    background-size: 100% auto;
}
.star.on {
    background-image: url('http://hwangsunsoo.com/customer/tripcody/images/icon-shopping-star-big-yellow.svg');
}
.score {
    display: inline-block;
    margin-left: 20px;
    font-size: 60px;
}
</style>
</head>
<body>


<div class="starArea">
    <span class="star"></span>
    <span class="star"></span>
    <span class="star"></span>
    <span class="star"></span>
    <span class="star"></span>
    <strong class="score"></strong>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

const score = 3.6;
const star = $('.starArea .star');
// Math.round, Math.ceil, Math.floor 차이점 이해
for(let i = 0; i < Math.round(score); i++) {
    star.eq(i).addClass('on');
}
$('.starArea .score').html(score);
</script>

</body>
</html>








