package com.bean;

import java.io.Serializable;

/**
 * Created by Administrator on 2019/4/5.
 */
public class Custom implements Serializable {
    private static final long serialVersionUID = -5711921573647515531L;
    private int id;
    private String customname;
    private String commission1;
    private String commission2;
    private String wage;
    private String customtype;

    public Custom() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomname() {
        return customname;
    }

    public void setCustomname(String customname) {
        this.customname = customname;
    }

    public String getCommission1() {
        return commission1;
    }

    public void setCommission1(String commission1) {
        this.commission1 = commission1;
    }

    public String getCommission2() {
        return commission2;
    }

    public void setCommission2(String commission2) {
        this.commission2 = commission2;
    }

    public String getWage() {
        return wage;
    }

    public void setWage(String wage) {
        this.wage = wage;
    }

    public String getCustomtype() {
        return customtype;
    }

    public void setCustomtype(String customtype) {
        this.customtype = customtype;
    }
}

