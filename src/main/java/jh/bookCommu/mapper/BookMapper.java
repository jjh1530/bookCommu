package jh.bookCommu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import jh.bookCommu.vo.BoardVO;
import jh.bookCommu.vo.BookApiVO;
import jh.bookCommu.vo.BookContactVO;
import jh.bookCommu.vo.BookReplyVO;
import jh.bookCommu.vo.BookVO;

@Mapper
public interface BookMapper {
	
	public List<BookVO> getLists(String title);  //전체리스트
	
	public void replyInsert(BookReplyVO vo);
	
	public void bookInsert(BookApiVO vo);
	
	public List<BookApiVO> getBook(int idx);
	
	public int getIdx(String title);
	
	public int isTitle(String title);
	
	public String getReplyTitle(int idx);
	
	public List<BookApiVO> getReply(String title);
	
	public int contact(BookContactVO vo);
}
 