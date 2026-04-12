package com.nilavu.dao;

import java.util.List;

import com.nilavu.model.Address;

public interface AddressDAO {
    List<Address> getAddressByUser(int userId);
    void addAddress(Address address);
    Address getAddressById(int addressId);
}
