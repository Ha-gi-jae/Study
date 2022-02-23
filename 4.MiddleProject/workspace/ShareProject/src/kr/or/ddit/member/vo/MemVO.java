package kr.or.ddit.member.vo;

import java.util.Date;

public class MemVO {
	
	private String mem_id;
	private String mem_pass;
	private String mem_group;
	private String mem_addr1;
	private String mem_addr2;
	private String mem_hp;
	private String mem_name;
	private String mem_sub;
	private int mem_chk;
	
	
	public int getMem_chk() {
		return mem_chk;
	}
	public void setMem_chk(int mem_chk) {
		this.mem_chk = mem_chk;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_group() {
		return mem_group;
	}
	public void setMem_group(String mem_group) {
		this.mem_group = mem_group;
	}
	
	public String getMem_addr1() {
		return mem_addr1;
	}
	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public String getMem_hp() {
		return mem_hp;
	}
	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_sub() {
		return mem_sub;
	}
	public void setMem_sub(String mem_sub) {
		this.mem_sub = mem_sub;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	private String class_id;


	@Override
	public String toString() {
		return "MemVO [mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_group=" + mem_group + ", mem_addr1="
				+ mem_addr1 + ", mem_addr2=" + mem_addr2 + ", mem_hp=" + mem_hp + ", mem_name=" + mem_name
				+ ", mem_sub=" + mem_sub + ", mem_chk=" + mem_chk + ", class_id=" + class_id + "]";
	}
	
	
	
}
