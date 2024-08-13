package com.kh.sintoburi.service.ji;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sintoburi.domain.ji.ImageVo;
import com.kh.sintoburi.mapper.ji.ImageMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageMapper imageMapper;
	
	@Override
	@Transactional
    public boolean saveImage(ImageVo imageVo) {
        int count = imageMapper.insertImg(imageVo); 
        return (count > 0) ? true : false;
	}

	@Override
	@Transactional
	public ImageVo getImageByProductNo(int pno) {
		ImageVo imageVo = imageMapper.getImageByProductNo(pno);
	    return imageVo;
	}

	@Override
	public List<ImageVo> getImgList(int pno) {
	    return imageMapper.getImgList(pno);
	}
}
