package com.multi.ongo.deal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DealBoard_Controller {

	DealBoard_Service service;
	
	@Autowired
	public DealBoard_Controller(DealBoard_Service service) {
		super();
		this.service = service;
	}

	@RequestMapping("dealmain") //테스트
	public String dealPage() {
		return "deal_Register";
		
	}
	
	//중고거래 등록페이지 config-view처리
	
	
	// 중고거래 게시글등록
	@RequestMapping("deal_Write.do")
	public String dealWrite(DealBoard_DTO dto) {
//		System.out.println("id : " + dto.getId());
//		System.out.println("dealType : " + dto.getDealType());
//		System.out.println("pro_category : " + dto.getProduct_category());
//		System.out.println("pro_state : " + dto.getProduct_state());
//		System.out.println("pro_price : " + dto.getProduct_price());
//		System.out.println("board_title : " + dto.getBoard_title());
//		System.out.println("pro_name : " + dto.getProduct_name());
		System.out.println("board_content : " + dto.getBoard_content());
//		System.out.println("hits : " + dto.getHits());
//		System.out.println("writeDate : " + dto.getWrite_date());
//		System.out.println("deal_no : " + dto.getDeal_number());
		service.writeProd(dto);
		return "index";
		
		
	}
	
	
	//중고거래게시글 전체리스트
	@RequestMapping("deal_listAll.do")
	public ModelAndView listall() {
		ModelAndView mav = new ModelAndView("deallistAll");
		List<DealBoard_DTO> listall = service.boardlist();
		//System.out.println("listall 찍기체크1 : " + listall);
		mav.addObject("listall",listall);
		//System.out.println("listall 찍기체크2 : " + listall);
		return mav;
	}
	
	//중고거래게시글 읽기
	@RequestMapping("dealRead.do")
	public ModelAndView dealRead(int deal_number, String state) {
		DealBoard_DTO dealRead = service.dealRead(deal_number);
		String view = "";
		if(state.equals("READ")) {
			view ="dealBoardRead";
		}else {
			view ="dealBoardUpdate";
		}
		ModelAndView mav = new ModelAndView(view);
		mav.addObject("dealRead",dealRead);
		//System.out.println("찍먹no:" + deal_number);
		//System.out.println("찍먹state:" + state);
		return mav;
	}
	
	@RequestMapping("dealUpdate.do")
	public String update(DealBoard_DTO dto) {
		//System.out.println("넘어오는가?찍먹1: " + dto);
		//System.out.println("getDeal_number넘어오는가?찍먹1: " + dto.getDeal_number());
		service.update(dto);
		//System.out.println("넘어오는가?찍먹2: " + dto);
		return "redirect:deal_listAll.do";
	}
	
	@RequestMapping("dealDelete.do")
	public String dealDelete(String id) {
		service.dealDelete(id);
		return "redirect:deal_listAll.do";
	}
	
	
//	/@ResponseBody는 웹페이지를 응답하지않고 response body에 String을 추가해서 response하겠다는 의미
	@RequestMapping("getString")  
	@ResponseBody
	public String responseString() {
		return "json";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}



