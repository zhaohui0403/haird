package com.model;

import java.util.List;

/**
 * Created by Administrator on 2019/4/12.
 */
public class Page<T> {
    private int index = 0;
    private int size = 20;
    private int offset;
    private int count;
    private List<T> context;
    private int maxPage;

    public Page() {
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

    public List<T> getContext() {
        return context;
    }

    public void setContext(List<T> context) {
        this.context = context;
    }

    public int getMaxPage() {
        if(count % size > 0){
            return count/size + 1;
        }else {
            return count/size;
        }

    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
