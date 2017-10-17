package com.xtoucher.service.impl;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xtoucher.service.WeixinService;
import com.xtoucher.util.MessageUtil;
import com.xtoucher.util.entity.TextMessage;

@Service
public class WeixinServiceImpl implements WeixinService {

	private static Logger logger = Logger.getLogger(WeixinServiceImpl.class);

	public String processRequest(HttpServletRequest request) {
		// String respMessage = null;
		// 默认返回的文本消息内容
		String respMessage = "success";
		// xml请求解析
		Map<String, String> requestMap;
		try {
			requestMap = MessageUtil.pareXml(request);
			// 发送方账号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众账号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			// 默认回复此文本消息
			TextMessage defaultTextMessage = new TextMessage();
			defaultTextMessage.setToUserName(fromUserName);
			defaultTextMessage.setFromUserName(toUserName);
			defaultTextMessage.setCreateTime(new Date().getTime());
			defaultTextMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_TEXT);
			defaultTextMessage.setMsgId(UUID.randomUUID().toString());
			// 由于href属性值必须用双引号引起，这与字符串本身的双引号冲突，所以要转义
			defaultTextMessage.setContent("你好");
			// 将文本消息对象转换成xml字符串
			respMessage = MessageUtil.textMessageToXml(defaultTextMessage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// try {
		// // xml请求解析
		// Map<String, String> requestMap = MessageUtil.pareXml(request);
		//
		// // 发送方账号（open_id）
		// String fromUserName = requestMap.get("FromUserName");
		// // 公众账号
		// String toUserName = requestMap.get("ToUserName");
		// // 消息类型
		// String msgType = requestMap.get("MsgType");
		//
		// // 默认回复此文本消息
		// TextMessage defaultTextMessage = new TextMessage();
		// defaultTextMessage.setToUserName(fromUserName);
		// defaultTextMessage.setFromUserName(toUserName);
		// defaultTextMessage.setCreateTime(new Date().getTime());
		// defaultTextMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_TEXT);
		// // 由于href属性值必须用双引号引起，这与字符串本身的双引号冲突，所以要转义
		// defaultTextMessage
		// .setContent("欢迎访问<a href=\"http://blog.csdn.net/j086924\">jon的博客</a>!");
		// // defaultTextMessage.setContent(getMainMenu());
		// // 将文本消息对象转换成xml字符串
		// respMessage = MessageUtil.textMessageToXml(defaultTextMessage);
		//
		// // 文本消息
		// if (msgType.equals(MessageUtil.MESSSAGE_TYPE_TEXT)) {
		// // respContent = "Hi,您发送的是文本消息！";
		// // 回复文本消息
		// TextMessage textMessage = new TextMessage();
		// // textMessage.setToUserName(toUserName);
		// // textMessage.setFromUserName(fromUserName);
		// // 这里需要注意，否则无法回复消息给用户了
		// textMessage.setToUserName(fromUserName);
		// textMessage.setFromUserName(toUserName);
		// textMessage.setCreateTime(new Date().getTime());
		// textMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_TEXT);
		// respContent = "Hi，你发的消息是：" + requestMap.get("Content");
		// textMessage.setContent(respContent);
		// respMessage = MessageUtil.textMessageToXml(textMessage);
		// }
		// // 图片消息
		// else if (msgType.equals(MessageUtil.MESSSAGE_TYPE_IMAGE)) {
		//
		// ImageMessage imageMessage = new ImageMessage();
		// imageMessage.setToUserName(fromUserName);
		// imageMessage.setFromUserName(toUserName);
		// imageMessage.setCreateTime(new Date().getTime());
		// imageMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_IMAGE);
		// // respContent=requestMap.get("PicUrl");
		// imageMessage
		// .setPicUrl("http://img24.pplive.cn//2013//07//24//12103112092_230X306.jpg");
		// respMessage = MessageUtil.imageMessageToXml(imageMessage);
		// }
		// // 地理位置
		// // else if(msgType.equals(MessageUtil.MESSSAGE_TYPE_LOCATION)){
		// // LocationMessage locationMessage=new LocationMessage();
		// // locationMessage.setToUserName(fromUserName);
		// // locationMessage.setFromUserName(toUserName);
		// // locationMessage.setCreateTime(new Date().getTime());
		// // locationMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_LOCATION);
		// // locationMessage.setLocation_X(requestMap.get("Location_X"));
		// // locationMessage.setLocation_Y(requestMap.get("Location_Y"));
		// // locationMessage.setScale(requestMap.get("Scale"));
		// // locationMessage.setLabel(requestMap.get("Label"));
		// // respMessage = MessageUtil.locationMessageToXml(locationMessage);
		// //
		// // }
		//
		// // 视频消息
		// // else if(msgType.equals(MessageUtil.MESSSAGE_TYPE_VIDEO)){
		// // VideoMessage videoMessage=new VideoMessage();
		// // videoMessage.setToUserName(fromUserName);
		// // videoMessage.setFromUserName(toUserName);
		// // videoMessage.setCreateTime(new Date().getTime());
		// // videoMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_VIDEO);
		// // videoMessage.setMediaId(requestMap.get("MediaId"));
		// // videoMessage.setThumbMediaId(requestMap.get("ThumbMediaId"));
		// // respMessage = MessageUtil.videoMessageToXml(videoMessage);
		// //
		// // }
		// // 链接消息
		// // else if(msgType.equals(MessageUtil.MESSSAGE_TYPE_LINK)){
		// // LinkMessage linkMessage=new LinkMessage();
		// // linkMessage.setToUserName(fromUserName);
		// // linkMessage.setFromUserName(toUserName);
		// // linkMessage.setCreateTime(new Date().getTime());
		// // linkMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_LINK);
		// // linkMessage.setTitle(requestMap.get("Title"));
		// // linkMessage.setDescription(requestMap.get("Description"));
		// // linkMessage.setUrl(requestMap.get("Url"));
		// // respMessage = MessageUtil.linkMessageToXml(linkMessage);
		// // }
		// // 语音消息
		// // else if(msgType.equals(MessageUtil.MESSSAGE_TYPE_VOICE)){
		// // VoiceMessage voiceMessage=new VoiceMessage();
		// // voiceMessage.setToUserName(fromUserName);
		// // voiceMessage.setFromUserName(toUserName);
		// // voiceMessage.setCreateTime(new Date().getTime());
		// // voiceMessage.setMsgType(MessageUtil.MESSSAGE_TYPE_VOICE);
		// // voiceMessage.setMediaId(requestMap.get("MediaId"));
		// // voiceMessage.setFormat(requestMap.get("Format"));
		// // respMessage = MessageUtil.voiceMessageToXml(voiceMessage);
		// // }
		// // 事件推送
		// else if (msgType.equals(MessageUtil.MESSSAGE_TYPE_EVENT)) {
		// // 事件类型
		// String eventType = requestMap.get("Event");
		// // 订阅
		// if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
		// respContent = "谢谢关注！";
		// }
		// // 取消订阅
		// else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
		// //
		// System.out.println("取消订阅");
		//
		// } else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
		// // 自定义菜单消息处理
		// System.out.println("自定义菜单消息处理");
		// }
		// }
		//
		// } catch (Exception e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		return respMessage;
	}

}