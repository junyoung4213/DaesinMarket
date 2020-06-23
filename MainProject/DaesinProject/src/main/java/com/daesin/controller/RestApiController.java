package com.daesin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.daesin.beans.MemberBean;
import com.daesin.service.MemberService;

@RestController
public class RestApiController {

	@Autowired
	private MemberService memberService;

	@GetMapping(value = "/member/checkMemberIdExist/{m_id}")
	public String checkMemberIdExist(@PathVariable String m_id) {
		boolean chk = memberService.checkMemberIdExist(m_id);

		return chk + "";
	}

	@GetMapping(value = "/member/returnId/{m_email}")
	public String returnId(@PathVariable String m_email) {
		// 이메일 주소를 서버에서 받을 때, '.com'을 잘라내는 현상을 발견.
		// 뒷 부분에 '.com'을 붙여줘야 제대로 해당 이메일로 가입한 아이디를 찾을 수 있다.
		m_email += ".com";
		String member_id = memberService.returnId(m_email);
		return member_id + "";
	}

	@GetMapping(value = "/member/returnPoint/{m_id}")
	public String returnPoint(@PathVariable String m_id, HttpSession session) {
		MemberBean member = (MemberBean)session.getAttribute("member");
		int mPoint = memberService.returnPoint(m_id);
		member.setmPoint(mPoint);
		session.setAttribute("member", member);
		
		return  mPoint + "";
	}

	@RequestMapping(value = "/supporter/sms", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> supporterSms(@RequestBody String jsonData) throws Exception {
		
		System.out.println(jsonData.toString());
		Map<String,String> signature = makeSignature();
		
		String url = "https://sens.apigw.ntruss.com/sms/v2/services/ncp:sms:kr:259554053327:daesin_project/messages";

		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", "application/json; charset=UTF-8");
		headers.set("x-ncp-apigw-timestamp", signature.get("timestamp"));
		headers.set("x-ncp-iam-access-key", signature.get("accessKey"));
		headers.set("x-ncp-apigw-signature-v2", signature.get("signature"));
		
		HttpEntity<String> request = new HttpEntity<String>(jsonData,headers);
		
		RestTemplate rt = new RestTemplate();
		ResponseEntity<String> responseEntity = rt.postForEntity(url, request, String.class);
		
		return responseEntity;
	}
	
	public Map<String,String> makeSignature() throws Exception {
		String space = " ";					// one space
		String newLine = "\n";					// new line
		String method = "POST";					// method
		String url = "/sms/v2/services/ncp:sms:kr:259554053327:daesin_project/messages";	// url (include query string)
		String timestamp = System.currentTimeMillis()+"";			// current timestamp (epoch)
		String accessKey = "RXTDdstRRq06rbzA0Oo1";			// access key id (from portal or Sub Account)
		String secretKey = "oc4gHYWQ64PJlZ1PZ2OAHAzvWwQvdGaSBiNRxyFe";
		
		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);

		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		String encodeBase64String = Base64.encodeBase64String(rawHmac);
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("signature", encodeBase64String);
		map.put("accessKey", accessKey);
		map.put("timestamp", timestamp);

	  return map;
	}
	
}
