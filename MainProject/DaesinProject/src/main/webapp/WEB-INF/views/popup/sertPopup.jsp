<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%response.setHeader("Access-Control-Allow-Origin","*"); %>
<c:set var="root" value="${pageContext.request.contextPath}/" />


<c:import url="/WEB-INF/views/include/top_menu.jsp" />

<div class="col-lg-12 text-center">
	<button type="button" onclick="cert();">문자 보내기 버튼</button>
</div>


<c:import url="/WEB-INF/views/include/bottom_info.jsp" />
<script>
function cert() {
	const space = " "; // one space
	const newLine = "\n"; // new line
	const method = "GET"; // method
	const uri = "0-ESA-202006-607676-0";
	const url = "https://sens.apigw.ntruss.com/sms/v2/services/${uri}/messages"; // url (include query string)
	const url2 = "/sms/v2/services/${uri}/messages";
	const timestamp = Date.now().toString(); // current timestamp (epoch)
	const accessKey = "RXTDdstRRq06rbzA0Oo1"; // access key id (from portal or Sub Account)
	const secretKey = "oc4gHYWQ64PJlZ1PZ2OAHAzvWwQvdGaSBiNRxyFe"; // secret key (from portal or Sub Account)

	var hmac = CryptoJS.algo.HMAC.create(CryptoJS.algo.SHA256, secretKey);
	hmac.update(method);
	hmac.update(space);
	hmac.update(url2);
	hmac.update(newLine);
	hmac.update(timestamp);
	hmac.update(newLine);
	hmac.update(accessKey);

	var hash = hmac.finalize();

	const signature = hash.toString(CryptoJS.enc.Base64);

	console.log(signature);
	
	$.ajax({
		type : 'POST',
		url : "https://sens.apigw.ntruss.com/sms/v2/services/0-ESA-202006-607676-0/messages",
		dataType : "json",
		beforeSend: function (xhr) {
            xhr.setRequestHeader("Access-Control-Allow-Origin","*");
            xhr.setRequestHeader("Access-Control-Allow-Headers","origin, x-requested-with, content-type, accept");
            xhr.setRequestHeader("Content-Type","application/json; charset=utf-8");
            xhr.setRequestHeader("x-ncp-apigw-timestamp",timestamp);
            xhr.setRequestHeader("x-ncp-iam-access-key",accessKey);
            xhr.setRequestHeader("x-ncp-apigw-signature-v2",signature);
        },
		/* headers:{"Access-Control-Allow-Origin": "*",
				"Access-Control-Allow-Headers": "origin, x-requested-with, content-type, accept",
				  "Content-Type" : "application/json; charset=utf-8",
				 "x-ncp-apigw-timestamp" : timestamp,
				 "x-ncp-iam-access-key" : accessKey,
				 "x-ncp-apigw-signature-v2" : signature}, */
		data : {
			"type" : "SMS",
			"contentType" : "COMM",
			"from" : "01094750503",
			"subject" : "본인인증 문자입니다",
			"countryCode" : "82",
			"content" : "테스트중입니다",
			"messages" : [ {
				"to" : "01094750503",
				"subject" : "본인인증 문자2",
				"content" : "테스트중2"
			} ]
		},
		/* beforeSend : function(xhr) {
			xhr.setRequestHeader("Content-Type",
					"application/json; charset=utf-8");
			xhr.setRequestHeader("x-ncp-apigw-timestamp", timestamp);
			xhr.setRequestHeader("x-ncp-iam-access-key", accessKey);
			xhr.setRequestHeader("x-ncp-apigw-signature-v2", signature);
		}, */
		success : function(data) {
			if (data.statusCode == 202) {
				console.log("성공")
			} else {
				console.log("실패")
			}
		},
		fail : function(data){
			console.log(data);
		}
	});
}
</script>
</body>
</html>









