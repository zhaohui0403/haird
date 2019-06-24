package com.bean;

import com.model.Pageable;
import com.utils.DateUtils;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2019/4/5.
 * 会员
 */
public class Member extends Pageable implements Serializable {
    private static final long serialVersionUID = 5894930696075789392L;
    private Integer id;
    private String username;
    private String telephone;
    private String sex;
    private String customType;
    private String referrer;
    private String amout;
    private Date signtime;

    public Member() {
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCustomType() {
        return customType;
    }

    public void setCustomType(String customType) {
        this.customType = customType;
    }

    public String getReferrer() {
        return referrer;
    }

    public void setReferrer(String referrer) {
        this.referrer = referrer;
    }

    public String getAmout() {
        return amout;
    }

    public void setAmout(String amout) {
        this.amout = amout;
    }

    public Date getSigntime() {
        return signtime;
    }

    public void setSigntime(Date signtime) {
        this.signtime = signtime;
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
}
