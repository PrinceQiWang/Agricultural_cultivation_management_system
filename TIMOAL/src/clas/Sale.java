package clas;

import java.util.Date;

public class Sale {
private int id;
private int id_f;
private Date date_i;
private int id_m;
private int id_a;
private int type_v;
private Date date_s;
private double price ;
private int amount;
private String direction;
private String executant;
private String conclusion;
private int building;
private int fence;
private String remarks;
public String getRemarks() {
	return remarks;
}
public void setRemarks(String remarks) {
	this.remarks = remarks;
}
public int getBuilding() {
	return building;
}
public void setBuilding(int building) {
	this.building = building;
}
public int getFence() {
	return fence;
}
public void setFence(int fence) {
	this.fence = fence;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getId_f() {
	return id_f;
}
public void setId_f(int id_f) {
	this.id_f = id_f;
}
public Date getDate_i() {
	return date_i;
}
public void setDate_i(Date date_i) {
	this.date_i = date_i;
}
public int getId_m() {
	return id_m;
}
public void setId_m(int id_m) {
	this.id_m = id_m;
}
public int getId_a() {
	return id_a;
}
public void setId_a(int id_a) {
	this.id_a = id_a;
}
public int getType_v() {
	return type_v;
}
public void setType_v(int type_v) {
	this.type_v = type_v;
}
public Date getDate_s() {
	return date_s;
}
public void setDate_s(Date date_s) {
	this.date_s = date_s;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getAmount() {
	return amount;
}
public void setAmount(int amount) {
	this.amount = amount;
}
public String getDirection() {
	return direction;
}
public void setDirection(String direction) {
	this.direction = direction;
}
public String getExecutant() {
	return executant;
}
public void setExecutant(String executant) {
	this.executant = executant;
}
public String getConclusion() {
	return conclusion;
}
public void setConclusion(String conclusion) {
	this.conclusion = conclusion;
}

}