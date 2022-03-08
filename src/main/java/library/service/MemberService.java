package library.service;

import java.util.ArrayList;

import library.DTO.MemberDTO;

public interface MemberService {

	//회원 가입 처리
	public void memberInsert(String id, String pw, String name, String email);

	//로그인 처리
	public MemberDTO memberLogin(String id);
	
	//회원 리스트
	public ArrayList<MemberDTO> memberList(int limitStart);
	
	//회원 정보 수정
	public void memberEdit(String id, String pw, String name, String email);

	//회원 찾기
	public ArrayList<MemberDTO> searchMember(String search, String searchText);
	
	//회원 특이사항 저장
	public void memberOther(String id, String other);
	
	//회원 수
	public int memberCount();
}
