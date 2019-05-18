package com.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2019/4/5.
 */
public class Recharge implements Serializable{
    private static final long serialVersionUID = 235786207283379400L;
    private int id;
    private Integer memberid;
    private String amout;
    private String paytype;
    private String handlerman;
    private Date paytime;
    private String description;
    //当前余额
    private String balance;
    private int recordId;

    public Recharge() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public String getAmout() {
        return amout;
    }

    public void setAmout(String amout) {
        this.amout = amout;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getHandlerman() {
        return handlerman;
    }

    public void setHandlerman(String handlerman) {
        this.handlerman = handlerman;
    }

    public Date getPaytime() {
        return paytime;
    }

    public void setPaytime(Date paytime) {
        this.paytime = paytime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }
}
