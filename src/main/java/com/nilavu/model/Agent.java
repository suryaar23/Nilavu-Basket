package com.nilavu.model;

public class Agent {
	private int agent_id;
	private String name;
	private String phone;
	private String status;
	
	
	public Agent(int agent_id, String name, String phone, String status) {
		super();
		this.agent_id = agent_id;
		this.name = name;
		this.phone = phone;
		this.status = status;
	}


	public Agent() {
		super();
	}


	public int getAgent_id() {
		return agent_id;
	}


	public void setAgent_id(int agent_id) {
		this.agent_id = agent_id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Agent [agent_id=" + agent_id + ", name=" + name + ", phone=" + phone + ", status=" + status + "]";
	}
	
}

