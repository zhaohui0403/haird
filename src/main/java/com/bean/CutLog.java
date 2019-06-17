package com.bean;

import java.util.Date;

/**
 * Created by ADMIN on 2019/6/8.
 * 剪发
 */
public class CutLog {
    
    private Integer id;

    private String cardId;

    private Date cutDate;

    public CutLog() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public Date getCutDate() {
        return cutDate;
    }

    public void setCutDate(Date cutDate) {
        this.cutDate = cutDate;
    }
}
