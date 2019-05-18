package com;

import com.bean.Funds;
import com.bean.Member;
import com.bean.Record;
import com.dao.MemberDao;
import com.dao.RecordDao;
import com.service.FundsService;
import com.utils.DateUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class HairdApplicationTests {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private RecordDao recordDao;
	@Autowired
	private FundsService fundsService;

	@Test
	public void contextLoads() {
	}

	@org.junit.Test
	public void test1(){
//		int count = memberDao.count(new Member());
//		Member member = new Member();
//		member.setAmout("0");
//		member.setCustomType("0");
//		member.setSex("1");
//		member.setSigntime(new Date());
//		member.setUsername("123");
//		member.setTelephone("1231");
//		memberDao.addMember(member);
		List<Record> records = recordDao.getRecords(new Record());

	}
	@Test
	public void test2(){
        Date theDayStartDate = DateUtils.getYearStartDate();
    }

    @Test
	public void test3(){
//		List<Funds> inComeFunds = fundsService.getInComeFunds(new Funds());
		List<Member> members = memberDao.getMembers(new Member());
	}

}
