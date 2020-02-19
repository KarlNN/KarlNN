<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	JSTL学习：
		作用：提高在jsp中的逻辑代码的编写效率，使用标签。
		使用：jstl的核心标签库--重点、格式化标签库--讲解、sql标签库、函数标签库、xml标签库
		核心标签库：
			a、导入jar包，
			b、声明标签库的引入，<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		必须要有，
			c、内容，
				基本标签：
				<c:out value="数据" default="默认值" />，数据可以是常量也可以是el表达式，作用是把数据输出给客户端
				<c:set var="hello" value="application" scope="application" ></c:set>，存储数据到作用域对象中，var存储的键名，
					value存储的数据，scope要存储的作用域对象--page, request, session, application
				<c:remove var="hello" scope="page" />，删除作用域中的制定键值的数据，var键值，scope指定作用域，如果不指定作用域，会删除
					四个作用域中所有该键值的数据
				逻辑标签：
					<c:if test="${ 表达式 }" > 前端代码 </c:if> 
						作用：进行逻辑判断，相当于java中的单分支判断
						注意：逻辑判断标签需要依赖于el的逻辑运算，也就是表达式中涉及到的数据必须从作用域中获取
					<c:choose>
						<c:when test="">执行内容</c:when>
						<c:when test="">执行内容</c:when>
						...
						<c:otherwise>执行内容</c:otherwise>
					</c:choose>
						作用：用来进行多条件判断，类似于Java中的多分支语句
						注意：条件成立只会执行一次，都不成立执行otherwise
				循环标签：
					<c:forEach begin="1" end="4" step="2" varStatus="vs" items="${ lst }" var="str" >
						循环体
					</c:forEach>
						作用：循环内容进行处理
						使用：begin声明循环开始位置，end声明循环结束位置，step声明循环步长，varStatus声明变量记录有关循环的数据(index，count，
							first，last), items声明遍历的对象，结合el表达式获取对象，var声明变量记录每次循环的结果，结合el表达式获取数据



--%>
<%
	request.setAttribute("str", "dasfdsfs");
 %>
<!-- 基本标签学习 -->
<h3>基本标签</h3>
<c:out value="haha"></c:out>
<c:out value="${ str2 }" default="sdsdds" />
<c:set var="hello" value="page" scope="page" ></c:set>
<c:set var="hello" value="request" scope="request" ></c:set>
<c:set var="hello" value="session" scope="session" ></c:set>
<c:set var="hello" value="application" scope="application" ></c:set>
<%-- <c:out value="${ sessionScope.hello }"	/>--%>
<c:remove var="hello" scope="page" />
<c:out value="${ hello }"></c:out>
<br>
<!-- 逻辑标签学习 -->
<h3>逻辑标签</h3>
<!-- 传统方式 -->
<%
	int a = 4;
	if(a >= 3) {
%>
<b>今天的天气有点热！</b>
<%} %>
 
<!-- jstl方式 -->
<c:set var="a" value="5" scope="page"></c:set>
<c:if test="${ a > 3 }">
	 <b>今天的天气有点热！</b>	
</c:if>

<c:set var="score" value="78"/>
<c:choose>
	<c:when test="${ score >= 90 }">
		<i>奖励吃鸡装备一套</i>
	</c:when>	
	<c:when test="${ score >= 80 && score < 90 }">
		<i>奖励空投</i>
	</c:when>
	<c:when test="${ score >= 70 && score < 80 }">
		<i>无奖励无惩罚</i>
	</c:when>
	<c:otherwise>
		<i>男女混合双打</i>
	</c:otherwise>	
</c:choose>

<hr/>
<h3>JSTL的循环标签</h3>
<!-- 传统方式 -->
<table border="1px">
	<tr>
		<td>课程名称</td>
		<td>教师</td>
		<td>价格</td>
		<td>重要性</td>
	</tr>
	<%
		for(int i = 0; i < 3; i++){%>
			<tr>
				<td>java</td>
				<td>张老师</td>
				<td>不要钱</td>
				<td>非常重要</td>
			</tr>
		<%}
	%>
</table>
<!-- jstl方式 -->
<%
	ArrayList<String> lst = new ArrayList<String>();
	lst.add("a");
	lst.add("b");
	lst.add("c");
	lst.add("d");
	request.setAttribute("lst", lst);
	
	HashMap<String, String> hs = new HashMap<String, String>();
	hs.put("a1", "hahaha");
	hs.put("b1", "blabla");
	request.setAttribute("hs", hs);
	
%>
<c:forEach begin="1" end="4" step="2" varStatus="vs">
	1111--${ vs.index }--${ vs.count }--${ vs.first }--${ vs.last } <br />
</c:forEach>

<c:forEach items="${ lst }" var="str" >
	${ str } <br />
</c:forEach>

<table border="1px">
	<tr>
		<td>课程名称</td>
		<td>教师</td>
		<td>价格</td>
		<td>重要性</td>
	</tr>
	<c:forEach items="${ lst }" var="str1" >
		<tr>
			<td>${ str1 }</td>
			<td>${ str1 }</td>
			<td>${ str1 }</td>
			<td>${ str1 }</td>
		</tr>
	</c:forEach>
</table>

<!-- 遍历map集合 -->
<c:forEach items="${ hs }" var="h">
	${ h.key }--${ h.value }
</c:forEach>



























