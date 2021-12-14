package com.msix.client.address.service;

import java.util.List;

import com.msix.client.address.vo.AddressVO;

public interface AddressService {
	public List<AddressVO> addressList(AddressVO avo);
	public int addressInsert(AddressVO avo);
	public int addressUpdate(AddressVO avo);
	public int addressDelete(AddressVO avo);
	public AddressVO addressSelect(AddressVO avo);
}
