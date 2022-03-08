package library.serviceImp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.DTO.MemberDTO;
import library.mapper.MemberMapper;
import library.service.MemberService;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberMapper mapper;

	@Override
	public void memberInsert(String id, String pw, String name, String email) {
		mapper.memberInsert(id, pw, name, email);
	}

	@Override
	public MemberDTO memberLogin(String id) {
		return mapper.memberLogin(id);
	}

	@Override
	public ArrayList<MemberDTO> memberList(int limitStart) {
		return mapper.memberList(limitStart);
	}

	@Override
	public void memberEdit(String id, String pw, String name, String email) {
		mapper.memberEdit(id, pw, name, email);
	}

	@Override
	public ArrayList<MemberDTO> searchMember(String search, String searchText) {
		return mapper.searchMember(search, searchText);
	}

	@Override
	public void memberOther(String id, String other) {
		mapper.memberOther(id, other);
	}

	@Override
	public int memberCount() {
		return mapper.memberCount();
	}
	
	

}
