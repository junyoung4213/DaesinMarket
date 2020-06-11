package com.daesin.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.daesin.beans.AlarmBean;
import com.daesin.beans.MemberBean;
import com.daesin.service.AlarmService;

public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	private AlarmService alarmService;

	// 로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		String senderId = getId(session);
		userSessionsMap.put(senderId, session);
		System.out.println(session.getId() + " 연결 됨.");
		System.out.println("아이디 : " + senderId);
//		alarmService.searchAlarm(receiver);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		System.out.println("메세지 전송받았음");
		if (!StringUtils.isEmpty(msg)) {
			
			System.out.println("메세지 통과함");
			String[] strs = msg.split(",");
			
			if(strs[0].equals("search") && strs[1] != null) {
				System.out.println("멤버 ID는 " + strs[1]);
				WebSocketSession boardWriterSession = userSessionsMap.get(strs[1]);
				List<AlarmBean> list = alarmService.searchAlarm(strs[1]);
				if(list!=null) {
					System.out.println("리스트 통과함");
				for (AlarmBean alarmBean : list) {
					TextMessage tmpMsg = new TextMessage(alarmBean.getACaller() + "님이 " + alarmBean.getABno() + "번 게시글에 댓글을 남겼습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				}
				}
			}

			if (strs != null && strs.length == 4) {
				String cmd = strs[0];
				String caller = strs[1];
				String receiver = strs[2];
				String seq = strs[3];
				
				
				System.out.println("로그인했는지 확인하기전");
				// 작성자가 로그인 해서 있다면
				WebSocketSession boardWriterSession = userSessionsMap.get(receiver);
				System.out.println("로그인했는지 확인한후");

				if ("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + seq + "번 게시글에 댓글을 남겼습니다.");
					boardWriterSession.sendMessage(tmpMsg);

				} else if ("follow".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver + "님을 팔로우를 시작했습니다.");
					boardWriterSession.sendMessage(tmpMsg);

				} else if ("scrap".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
					// 변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
							"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq=" + seq + "&mentors="
							+ receiver + "'>" + seq + "</a>번 에세이를 스크랩 했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}

		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 끊어짐.");
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberBean loginUser = (MemberBean) httpSession.get("member");
		if (loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getmId();
		}
	}

}