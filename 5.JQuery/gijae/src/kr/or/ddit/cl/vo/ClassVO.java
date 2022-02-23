package kr.or.ddit.cl.vo;

import java.util.Date;

public class ClassVO {
	
	private String class_id;
	private String class_name;
	private String mem_group;
	private String mem_name;
	private String mem_hp;
	private Date mem_start;
	private Date mem_end;
	private String mem_id;
	
	public String getMem_group() {
		return mem_group;
	}
	public void setMem_group(String mem_group) {
		this.mem_group = mem_group;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public Date getMem_start() {
		return mem_start;
	}
	public void setMem_start(Date mem_start) {
		this.mem_start = mem_start;
	}
	public Date getMem_end() {
		return mem_end;
	}
	public void setMem_end(Date mem_end) {
		this.mem_end = mem_end;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

}
