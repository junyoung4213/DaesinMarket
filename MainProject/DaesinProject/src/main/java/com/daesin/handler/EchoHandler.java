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
		if (!StringUtils.isEmpty(msg)) {

			String[] strs = msg.split(",");

			if (strs != null && strs.length == 3) {
				String cmd = strs[0];
				String receiver = strs[1];
				String saveMsg = strs[2];

				WebSocketSession boardWriterSession = userSessionsMap.get(receiver);
				if ("search".equals(cmd) && boardWriterSession != null) {
					System.out.println("멤버 ID는 " + receiver);

					List<AlarmBean> list = alarmService.searchAlarm(receiver);
					if (list != null) {
						for (AlarmBean alarmBean : list) {
							TextMessage tmpMsg = new TextMessage(alarmBean.getaMsg());
							boardWriterSession.sendMessage(tmpMsg);
						}
						alarmService.deleteAlarmAll(receiver);
					}
				} else if ("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(saveMsg);
					boardWriterSession.sendMessage(tmpMsg);
					alarmService.deleteAlarm(saveMsg);

				} else if ("accept".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(saveMsg);
					boardWriterSession.sendMessage(tmpMsg);
					alarmService.deleteAlarm(saveMsg);
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