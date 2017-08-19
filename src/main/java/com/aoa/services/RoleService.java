package com.aoa.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.aoa.models.Role;

@Service
public interface RoleService {

	List<Role> listroles();

}
