package com.service;

import com.bean.HairdCard;
import com.model.Page;

/**
 * Created by ADMIN on 2019/6/10.
 */
public interface HairdCardService {
    Page<HairdCard> getCards(HairdCard hairdCard);

    String card(HairdCard hairdCard);

    HairdCard getCardById(int cardId);

    void update(HairdCard hairdCard);
}
