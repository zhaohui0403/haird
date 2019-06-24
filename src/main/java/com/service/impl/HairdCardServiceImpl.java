package com.service.impl;

import com.bean.Funds;
import com.bean.HairdCard;
import com.dao.FundsDao;
import com.dao.HairdCardDao;
import com.model.Page;
import com.service.HairdCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ADMIN on 2019/6/10.
 */
@Service
public class HairdCardServiceImpl implements HairdCardService {

    @Autowired
    private HairdCardDao hairdCardDao;
    @Autowired
    private FundsDao fundsDao;

    @Override
    public Page<HairdCard> getCards(HairdCard hairdCard) {
        Page<HairdCard> cardPage = new Page<HairdCard>();

        cardPage.setIndex(hairdCard.getIndex());
        cardPage.setSize(hairdCard.getSize());

        List<HairdCard> hairdCards = new ArrayList<HairdCard>();

        List<String> cardList = hairdCardDao.getCardList(hairdCard);
        if(cardList != null && cardList.size() > 0){
            hairdCards = hairdCardDao.getHairdCards(cardList);
        }
        cardPage.setContext(hairdCards);

        int count = hairdCardDao.count(hairdCard);
        cardPage.setCount(count);
        return cardPage;
    }

    @Override
    @Transactional
    public String card(HairdCard hairdCard) {
        String cardId = hairdCardDao.getMaxCardId();
        if(cardId == null || cardId == ""){
            cardId = "001";
        }else {
            cardId = Integer.parseInt(cardId) + 1 + "";
            if(cardId.length() == 1){
                cardId = "00" + cardId;
            }else if(cardId.length() == 2){
                cardId = "0" + cardId;
            }
        }
        hairdCard.setCardId(cardId);
        hairdCardDao.addHairdCard(hairdCard);
        //入账
        Funds funds = new Funds();
        funds.setAmout(hairdCard.getAmout());
        funds.setConsumetype(0);
        funds.setPaytype(hairdCard.getPaytype());
        funds.setDes(hairdCard.getUsername() + "办理" + hairdCard.getAmout() + "元" + hairdCard.getTimes() + "次剪发卡,收入" + hairdCard.getAmout() + "元");
        funds.setCardId(hairdCard.getCardId());
        fundsDao.add(funds);
        return cardId;
    }

    @Override
    public HairdCard getCardById(int cardId) {
        return hairdCardDao.getHairdCardById(cardId);
    }

    @Override
    @Transactional
    public void update(HairdCard hairdCard) {
        hairdCardDao.update(hairdCard);
        Funds funds = new Funds();
        funds.setAmout(hairdCard.getAmout());
        funds.setConsumetype(0);
        funds.setPaytype(hairdCard.getPaytype());
        funds.setDes(hairdCard.getUsername() + "办理" + hairdCard.getAmout() + "元" + hairdCard.getTimes() + "次剪发卡,收入" + hairdCard.getAmout() + "元");
        funds.setCardId(hairdCard.getCardId());
        fundsDao.update(funds);
    }
}
