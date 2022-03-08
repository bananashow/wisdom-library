package library.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import library.DTO.HopeListDTO;

@Mapper
public interface HopeListMapper {

	// 희망 도서 신청받기
	@Insert("insert into hopelist(id, isbn, booktitle, author, link, requestdate) values(#{id}, #{isbn}, #{booktitle}, #{author}, #{link}, NOW())")
	public void hopeListAdd(@Param("id") String id, @Param("isbn") String isbn, @Param("booktitle") String booktitle, @Param("author") String author, @Param("link") String link);

	// 희망 도서 리스트 - 관리자 페이지
	@Select("select * from hopelist limit ${limitStart}, 10")
	public ArrayList<HopeListDTO> hopeList(@Param("limitStart") int limitStart);

	// 희망 도서 신청 개수
	@Select("select count(*) from hopelist")
	public int hopeBookCount();
	
	// 희망 도서 삭제 - 관리자 페이지
	@Delete("delete from hopelist where hnum = #{hnum}")
	public void hopeDelete(@Param("hnum") String hnum);
}
