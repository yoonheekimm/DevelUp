package com.multi.ongo.deal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class DealBoard_ServiceImpl implements DealBoard_Service {

	DealBoard_DAO dao;
	
	@Autowired
	public DealBoard_ServiceImpl(DealBoard_DAO dao) {
		super();
		this.dao = dao;
	}

	//중고거래등록
	@Override
	public int writeProd(DealBoard_DTO dto) {
		return dao.writeProd(dto);
	}

	//중고거래 전체조회
	@Override
	public List<DealBoard_DTO> boardlist() {
		return dao.boardlist();
	}
	
	//중고거래 게시글읽기
	@Override
	public DealBoard_DTO dealRead(int deal_number) {
		return dao.dealRead(deal_number);
	}
	//중고거래 게시글수정
	@Override
	public int update(DealBoard_DTO dto) {
		return dao.update(dto);
	}

	@Override
	public int dealDelete(String id) {
		return dao.dealDelete(id);
	}

}
