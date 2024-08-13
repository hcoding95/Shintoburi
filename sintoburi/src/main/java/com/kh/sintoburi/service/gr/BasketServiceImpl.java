package com.kh.sintoburi.service.gr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sintoburi.domain.gr.BasketDetailDto;
import com.kh.sintoburi.domain.gr.BasketDetailVo;
import com.kh.sintoburi.domain.gr.BasketVo;
import com.kh.sintoburi.mapper.gr.BasketMapper;

@Service
public class BasketServiceImpl implements BasketService{
	
	@Autowired
	private BasketMapper basketMapper;
	
	@Override
	public List<BasketDetailDto> getList(String user_id) {
		List<BasketDetailDto> list = basketMapper.getList(user_id);
		return list;
	}

	@Override
	public boolean getBasketKey(BasketVo basketVo) {
		int count = basketMapper.insertSelectKey(basketVo);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean putBasket(BasketDetailVo detailVo) {
		int count = basketMapper.insertDetail(detailVo);
		return (count == 1) ? true : false;
	}

	@Override
	public int getBnoByUserId(String user_id) {
		int bno = basketMapper.getBnoByUser(user_id);
		return bno;
	}

	@Override
	public boolean modifyCount(int p_count, int bdno) {
		int count = basketMapper.update(p_count, bdno);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean removeOne(int bdno) {
		int count = basketMapper.delete(bdno);
		return (count == 1) ? true : false;
	}

	@Override
	public boolean removeAll(int bno) {
		int count = basketMapper.deleteAll(bno); // 장바구니 내용물 모두 삭제
		count += basketMapper.deleteBasket(bno); // 장바구니 삭제
		return (count == 2) ? true : false;
	}
}
