package jh.bookCommu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jh.bookCommu.vo.UserVO;

@Mapper
public interface UserMapper {

	public int userLogin(UserVO vo);
	
	public UserVO user(UserVO vo);
	
	public int registerCheck(String userid);
	
	public int register(UserVO vo);
}
