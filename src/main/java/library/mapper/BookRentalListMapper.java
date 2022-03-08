package library.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import library.DTO.BookListDTO;
import library.DTO.BookRentalListDTO;

@Mapper
public interface BookRentalListMapper {
	// 로그인 되어있는 회원의 대여 리스트
	@Select("select * from bookrentallist where id = #{id} order by rentaldate desc")
	public ArrayList<BookRentalListDTO> rentalList(@Param("id") String id);

	// 로그인 되어있는 회원으로 대여 도서 추가
	@Insert("insert into bookrentallist(isbn, booktitle, id, name, email, rentaldate, duedate) values(#{isbn}, #{booktitle}, #{id}, #{name}, #{email}, now(), date_add(now(), interval 7 day))")
	public void rentalBookInsert(@Param("isbn") String isbn, @Param("booktitle") String booktitle, @Param("id") String id, @Param("name") String name, @Param("email") String email);

	// 전체 대여 도서 개수
	@Select("select count(*) from bookrentallist")
	public int rentalBookCount();
	
	// 천체 대여 리스트
	@Select("select * from bookrentallist limit ${limitStart}, 10")
	public ArrayList<BookRentalListDTO> rentalListAll(@Param("limitStart") int limitStart);
	
	// 괸리자 미반납 -> 반납 처리
	@Update("update bookrentallist set state = '반납' where rnum = ${rnum}")
	public void returnBook(@Param("rnum") int rnum);
	
	// 대여한 도서 찾기
	@Select("select * from booklist where ${search} like concat('%',#{searchText},'%')")
	public ArrayList<BookRentalListDTO> rentBookSearch(@Param("search") String search, @Param("searchText") String searchText);
	
}
