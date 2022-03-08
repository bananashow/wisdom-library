package library.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import library.DTO.MemberDTO;

@Mapper
public interface MemberMapper {

	//회원 가입 처리
	@Insert("insert into member(id, pw, name, email) values(#{id}, #{pw}, #{name}, #{email})")
	public void memberInsert(@Param("id") String id, @Param("pw") String pw, @Param("name") String name, @Param("email") String email);
	
	//로그인 처리
	@Select("select * from member where id = #{id}")
	public MemberDTO memberLogin(@Param("id") String id);
	
	//회원 리스트
	@Select("select * from member limit ${limitStart}, 10")
	public ArrayList<MemberDTO> memberList(@Param("limitStart") int limitStart);
	
	//회원 수
	@Select("select count(*) from member")
	public int memberCount();
	
	//회원 정보 수정
	@Update("update member set pw = #{pw}, name = #{name}, email = #{email} where id = #{id}")
	public void memberEdit(@Param("id") String id, @Param("pw") String pw, @Param("name") String name, @Param("email") String email);

	//회원 찾기
	@Select("select * from member where ${search} like concat('%',#{searchText},'%')")
	public ArrayList<MemberDTO> searchMember(@Param("search") String search, @Param("searchText") String searchText);
	
	//회원 특이사항 저장
	@Update("update member set other = #{other} where id = #{id}")
	public void memberOther(@Param("id") String id, @Param("other") String other);
}
