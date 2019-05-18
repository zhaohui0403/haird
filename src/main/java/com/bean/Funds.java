package com.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.model.Pageable;
import com.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2019/4/14.
 */
public class Funds implements Serializable{
    private Integer id;
    private String des;
    private int paytype;
    //消费类型0（充值）1（消费）-1(支出)
    private int consumetype;
    private String amout;
    private Date consdate;
    private int recordId;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date startTime;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date endTime;

    public Funds() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getPaytype() {
        return paytype;
    }

    public void setPaytype(int paytype) {
        this.paytype = paytype;
    }

    public int getConsumetype() {
        return consumetype;
    }

    public void setConsumetype(int consumetype) {
        this.consumetype = consumetype;
    }

    public String getAmout() {
        return amout;
    }

    public void setAmout(String amout) {
        this.amout = amout;
    }

    public Date getConsdate() {
        return consdate;
    }

    public void setConsdate(Date consdate) {
        this.consdate = consdate;
    }

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public Date getStartTime() {
        if(startTime == null){
            return DateUtils.getYearStartDate();
        }
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        if(endTime == null){
            return DateUtils.getTomoStartDate();
        }
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
