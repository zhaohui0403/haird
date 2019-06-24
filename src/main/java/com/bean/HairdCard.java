package com.bean;

import com.model.Pageable;
import com.utils.DateUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
*
*  @author zhh
 *  剪发卡
*/
public class HairdCard extends Pageable implements Serializable {

    private static final long serialVersionUID = 1560005543883L;

    private Integer id;
    
    private String username;
    
    private String telephone;

    private String amout;
    
    private int times;

    private String cardId;

    private List<CutLog> cutLogs = new ArrayList<CutLog>();

    private int paytype;

    private int status = 1;

    private int lastTimes;

    public HairdCard() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAmout() {
        return amout;
    }

    public void setAmout(String amout) {
        this.amout = amout;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public List<CutLog> getCutLogs() {
        return cutLogs;
    }

    public void setCutLogs(List<CutLog> cutLogs) {
        this.cutLogs = cutLogs;
    }

    public int getPaytype() {
        return paytype;
    }

    public void setPaytype(int paytype) {
        this.paytype = paytype;
    }

    @Override
    public Date getStartTime() {
        if(super.startTime == null || super.startTime.equals("")){
            return DateUtils.getMayDate();
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getLastTimes() {
        if(this.lastTimes == 0){
            this.lastTimes = times - cutLogs.size();
        }
        return lastTimes;
    }

    public void setLastTimes(int lastTimes) {
        this.lastTimes = lastTimes;
    }
}
