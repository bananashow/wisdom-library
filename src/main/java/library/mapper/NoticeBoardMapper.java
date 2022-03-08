package library.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import library.DTO.NoticeBoardDTO;

@Mapper
public interface NoticeBoardMapper {
	// 공지사항 화면에 뿌리기
	@Select("select * from noticeboard limit ${limitStart}, 10")
	public ArrayList<NoticeBoardDTO> noticeList(@Param("limitStart") int limitStart);
	
	// 공지사항 개수
	@Select("select count(*) from noticeboard")
	public int noticeCount();

	// 공지사항 내용 자세히 보기
	@Select("select * from noticeboard where nnum = #{nnum}")
	public NoticeBoardDTO noticeRead(@Param("nnum") int nnum);
	
	// 공지사항 수정
	@Update("update noticeboard set title = #{title}, content = #{content} where nnum = #{nnum}")
	public void noticeEdit(@Param("title") String title, @Param("content") String content, @Param("nnum") String nnum);

	// 공지사항 삭제
	@Delete("delete from noticeboard where nnum = #{nnum}")
	public void noticeDelete(@Param("nnum") String nnum);
	
	// 공지사항 글쓰기
	@Insert("insert into noticeboard(title, content, writeday) values(#{title}, #{content}, NOW())")
	public void noticeInsert(@Param("title") String title, @Param("content") String content);
}
