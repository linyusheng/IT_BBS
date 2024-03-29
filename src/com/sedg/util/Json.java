package com.sedg.util;

import com.sun.corba.se.spi.ior.iiop.JavaCodebaseComponent;

/**
 * JSON模型
 * 
 * @author 林玉生
 *
 */
@SuppressWarnings({ "unused", "serial" })
public class Json implements java.io.Serializable{
	
	private boolean success = false;//是否成功
	private String msg = "";		//提示信息
	private Object obj = null;		//其它信息
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	
}
