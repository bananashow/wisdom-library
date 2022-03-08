package library.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import library.DTO.BookListDTO;

@Mapper
public interface BookListMapper {
	// 등록된 도서 개수
	@Select("select count(*) from booklist")
	public int countBoard();

	// 도서 전체 리스트
	@Select("select * from booklist order by booktitle asc limit ${limitStart}, 10")
	public ArrayList<BookListDTO> list(@Param("limitStart") int limitStart);
	
	// 도서 찾기
	@Select("select * from booklist where ${search} like concat('%',#{searchText},'%')")
	public ArrayList<BookListDTO> searchbook(@Param("search") String search, @Param("searchText") String searchText);
	
	// 재고 수 화면에 출력
	@Select("select stock from booklist where isbn = #{isbn}")
	public String bookStockNum(@Param("isbn") String isbn);
	
	// 도서 대여 : 재고 수 -1 처리
	@Update("update booklist set stock = stock-1 where isbn = #{isbn}")
	public void bookStock(@Param("isbn") String isbn);
	
	// 도서 대여 : 재고 수 +1 처리
	@Update("update booklist set stock = stock+1 where isbn = #{isbn}")
	public void bookStockPlus(@Param("isbn") String isbn);
	
	// isbn으로 책 정보 가져오기
	@Select("select * from booklist where isbn = #{isbn}")
	public BookListDTO bookInfo(@Param("isbn") String isbn);
	
	// 도서 정보 수정
	@Update("update booklist set booktitle = #{booktitle}, author = #{author}, genre = #{genre}, company = #{company}, stock = #{stock} where isbn = #{isbn}")
	public void bookInfoEdit(@Param("isbn") String isbn, @Param("booktitle") String booktitle, @Param("author") String author, @Param("genre") String genre, @Param("company") String company, @Param("stock") int stock);

	// 도서 정보 삭제
	@Delete("delete from booklist where isbn = #{isbn}")
	public void bookDelete(@Param("isbn") String isbn);
	
	// 도서 추가
	@Insert("insert into booklist values(#{isbn}, #{booktitle}, #{author}, #{genre}, #{company}, ${stock})")
	public void bookAdd(@Param("isbn") String isbn, @Param("booktitle") String booktitle, @Param("author") String author, @Param("genre") String genre, @Param("company") String company, @Param("stock") int stock);
}
