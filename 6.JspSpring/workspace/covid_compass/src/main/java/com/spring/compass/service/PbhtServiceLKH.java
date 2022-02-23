package com.spring.compass.service;

import com.spring.compass.vo.PbhtVO;

public interface PbhtServiceLKH extends PbhtServiceLMY{
	
	public PbhtVO getPbhtByPbhtNo(String pbhtNo) throws Exception;

}
