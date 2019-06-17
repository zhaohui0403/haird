package com.dao;

import com.bean.HairdCard;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
*  @author zhh
*/
@Mapper
public interface HairdCardDao {
    List<HairdCard> getHairdCards(HairdCard hairdCard);

    void addHairdCard(HairdCard hairdCard);

    int count(HairdCard hairdCard);

    HairdCard getHairdCardById(int cardId);

    String getMaxCardId();

    void update(HairdCard hairdCard);

    List<HairdCard> getHairdCardByCardId(String cardId);

    void fail(HairdCard hairdCard);
}