package com.nilavu.dao;

import com.nilavu.model.Address;

public interface AddressDAO {
    Address getAddressByUser(int userId);
    void saveOrUpdate(Address address);
}
