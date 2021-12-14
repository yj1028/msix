package com.msix.client.address.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.msix.client.address.dao.AddressDAO;
import com.msix.client.address.vo.AddressVO;

import lombok.Setter;

@Service
public class AddressServicelmpl implements AddressService{
	
	@Setter(onMethod_=@Autowired)
	private AddressDAO addressDAO;

	@Override
	public List<AddressVO> addressList(AddressVO avo) {
		List<AddressVO> list = null;
		list = addressDAO.addressList(avo);
		return list;
	}

	@Override
	public int addressInsert(AddressVO avo) {
		int result = 0;
		result = addressDAO.addressInsert(avo);
		return result;
	}

	@Override
	public int addressUpdate(AddressVO avo) {
		int result = 0;
		result = addressDAO.addressUpdate(avo);
		return result;
	}

	@Override
	public int addressDelete(AddressVO avo) {
		int result = 0;
		result = addressDAO.addressDelete(avo);
		return result;
	}

	@Override
	public AddressVO addressSelect(AddressVO avo) {
		AddressVO vo = addressDAO.addressSelect(avo);
		return vo;
	}
	
}
