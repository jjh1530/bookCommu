package jh.bookCommu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jh.bookCommu.vo.BoardVO;

@Mapper
public interface BoardMapper {
	
	public List<BoardVO> getLists();  //전체리스트
}
