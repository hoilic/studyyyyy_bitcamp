<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="result" value="true" />
<c:set var="message" value="덧글이 삭제 되었습니다." />

<?xml version="1.0" encoding="UTF-8"?>
<comment>
	<result>${result }</result>
	<message>${message }</message>
</comment>