package com.bean;

import com.model.Pageable;
import com.utils.DateUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2019/4/5.
 * 消费
 */
public class Record extends Pageable implements Serializable{
    private static final long serialVersionUID = 3179586060771360413L;
    private int id;
    private String contype;
    private String discount;
    private String paytype;
    private Integer memberId;
    private String hairstye;
    private String assistant;
    private String haircommi;
    private String assicommi;
    private String amout;
    private Date contime;

    public Record() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContype() {
        return contype;
    }

    public void setContype(String contype) {
        this.contype = contype;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getPaytype() {
        return paytype;
    }

    public void setPaytype(String paytype) {
        this.paytype = paytype;
    }

    public String getHairstye() {
        return hairstye;
    }

    public void setHairstye(String hairstye) {
        this.hairstye = hairstye;
    }

    public String getAssistant() {
        return assistant;
    }

    public void setAssistant(String assistant) {
        this.assistant = assistant;
    }

    public String getHaircommi() {
        return haircommi;
    }

    public void setHaircommi(String haircommi) {
        this.haircommi = haircommi;
    }

    public String getAssicommi() {
        return assicommi;
    }

    public void setAssicommi(String assicommi) {
        this.assicommi = assicommi;
    }

    public String getAmout() {
        return amout;
    }

    public void setAmout(String amout) {
        this.amout = amout;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Date getContime() {
        return contime;
    }

    public void setContime(Date contime) {
        this.contime = contime;
    }
    @Override
    public Date getStartTime() {
        if(super.startTime == null || super.startTime.equals("")){
            return DateUtils.getMonthDate();
        }else {
            return startTime;
        }
    }

    @Override
    public Date getEndTime() {
        if(super.endTime == null || super.endTime.equals("")){
            return DateUtils.getTomoStartDate();
        }else {
            return endTime;
        }
    }
}
