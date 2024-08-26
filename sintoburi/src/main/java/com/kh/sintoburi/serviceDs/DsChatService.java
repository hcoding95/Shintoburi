package com.kh.sintoburi.serviceDs;

import java.util.List;

import com.kh.sintoburi.domainDs.DsChatVo;


public interface DsChatService {
	public boolean sendChat(DsChatVo vo);
	public List<DsChatVo> getChatLog();
	public boolean deleteChatLog();

}
