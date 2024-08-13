package com.kh.sintoburi.service.ji;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sintoburi.domain.ji.ImageVo;
import com.kh.sintoburi.domain.ji.ProductVo;
import com.kh.sintoburi.mapper.ji.ImageMapper;
import com.kh.sintoburi.mapper.ji.ProductMapper;
import com.kh.sintoburi.util.ji.MyFileUtil;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private ImageMapper imageMapper;
	
	@Autowired
    private MyFileUtil myFileUtil;
	
	// 상품 목록
	@Override
	public List<ProductVo> getProducts() {
		List<ProductVo> list = productMapper.getProducts();
		return list;
	}

	// 상품 등록
	@Override
	public Integer register(ProductVo vo) {
		System.out.println("register...");
		int count = productMapper.insertProduct(vo);
		if (count > 0) {
			return vo.getPno();
		}
		return count;
	}
	
	
	// 상품 상세보기
	@Override
	@Transactional
	public ProductVo getProductByNo(Integer pno) {
		System.out.println("get...");
		ProductVo vo = productMapper.selectByPno(pno);
		List<ImageVo> imageList = imageMapper.getImgList(pno);
		vo.setImageList(imageList);
		return vo;
	}
	
    // 상품 삭제
	@Transactional
	@Override
	public boolean remove(Integer pno) {
		System.out.println("remove...");
		
		int count = productMapper.deleteProduct(pno);
		return (count > 0) ? true : false;
	}

	@Override
	public List<ProductVo> selectProductsByCate(int cate_no) {
		List<ProductVo> list = productMapper.selectProductsByCate(cate_no);
		return list;
	} 


	
//	@Override
//	@Transactional
//    public boolean saveImage(ImageVo imageVo) {
//        int count = imgMapper.insertImg(imageVo); 
//        return (count > 0) ? true : false;
//	}
//
//	@Override
//	@Transactional
//	public ImageVo getImageByProductNo(int pno) {
//		ImageVo imageVo = imgMapper.getImageByProductNo(pno);
//	    return imageVo;
//	}
	 
//	// 상품 목록
//	@Override
//	public List<ProductVo> getProducts() {
//		List<ProductVo> list = productMapper.getProducts();
//		return list;
//	}
//	
//	// 상품 등록
//	@Override
//	@Transactional
//	public Integer register(ProductVo vo) {
//		System.out.println("register...");
//		int count = productMapper.insertProduct(vo);
//		if (count > 0) {
//			return vo.getPno();
//		}
//		return 0;
//	}
//	
//	@Transactional
//    @Override
//    public void saveImage(ImageVo image) {
//        imgMapper.insert(image);
//    }
//	
//	
//	// 상품 삭제 ex06 boardSserviceImpl 참조
//	@Transactional
//	@Override
//	public boolean remove(Integer pno) {
//		System.out.println("remove...");
//		
//		
//		int count = productMapper.deleteProduct(pno);
//		return (count > 0) ? true : false;
//	}
//
//	@Override
//	public void registerImgae(ImageVo vo) {
//		imgMapper.insert(vo);
//	}



}
