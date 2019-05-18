package com.bean;

import com.model.Pageable;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2019/4/5.
 */
public class Wage extends Pageable implements Serializable {
    private static final long serialVersionUID = -2831566991876172043L;
    private Integer id;
    private String customname;
    private String amout;
    private String description;
    private Date time;
    private int wageType;
    private Integer recordId;

    public Wage() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAmout() {
        return amout;
    }

    public void setAmout(String amout) {
        this.amout = amout;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getCustomname() {
        return customname;
    }

    public void setCustomname(String customname) {
        this.customname = customname;
    }

    public int getWageType() {
        return wageType;
    }

    public void setWageType(int wageType) {
        this.wageType = wageType;
    }
}
