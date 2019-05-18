package com.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Administrator on 2019/4/9.
 */
public class Pageable {
    private int index = 0;
    private int size = 20;
    private int offset;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date startTime = DateUtils.getStartDate();

    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date endTime = DateUtils.getTomoStartDate();
    public Pageable() {
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getOffset() {
        return index * size;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public Date getStartTime() {
        if(startTime == null || startTime.equals("")){
            return DateUtils.getStartDate();
        }else {
            return startTime;
        }
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        if(endTime == null || endTime.equals("")){
            return DateUtils.getTomoStartDate();
        }else {
            return endTime;
        }
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
}
