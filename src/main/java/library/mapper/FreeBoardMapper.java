package library.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import library.DTO.FreeBoardDTO;

@Mapper
public interface FreeBoardMapper {

	// 게시글 총 갯수
	@Select("select count(*) from freeboard")
	public int countBoard();
	
	// 자유 게시판 리스트										//0, 10, 20 ...
	@Select("select * from freeboard order by bnum desc limit ${limitStart}, 10")
	public ArrayList<FreeBoardDTO> freeBoardList(@Param("limitStart") int limitStart);
	
	// 게시글 찾기
	@Select("select * from freeboard where ${search} like concat('%',#{searchText},'%')")
	public ArrayList<FreeBoardDTO> searchBoard(@Param("search") String search, @Param("searchText") String searchText);

	// 게시글 작성
	@Insert("insert into freeboard(id, title, content, writeday) values(#{id}, #{title}, #{content}, sysdate())")
	public void boardWrite(@Param("id") String id, @Param("title") String title, @Param("content") String content);

	// 게시글 자세히 보기
	@Select("select * from freeboard where bnum = #{bnum}")
	public FreeBoardDTO boardReadMore(@Param("bnum") int bnum);
	
	// 게시글 자세히 보기 누르면 조회수 +1
	@Update("update freeboard set hits = hits+1 where bnum = #{bnum}")
	public void freeBoardHits(@Param("bnum") int bnum);
	
	// 게시글 수정
	@Update("update freeboard set title = #{title}, content = #{content} where bnum = #{bnum}")
	public void freeBoardEdit(@Param("title") String title, @Param("content") String content, @Param("bnum") int bnum);
	
	// 게시글 삭제
	@Delete("delete from freeboard where bnum = #{bnum}")
	public void freeBoardDelete(@Param("bnum") int bnum);
}
