package library.serviceImp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.DTO.NoticeBoardDTO;
import library.mapper.NoticeBoardMapper;
import library.service.NoticeBoardService;

@Service
public class NoticeBoardServiceImp implements NoticeBoardService {

	@Autowired
	NoticeBoardMapper mapper;

	@Override
	public ArrayList<NoticeBoardDTO> noticeList(int limitStart) {
		return mapper.noticeList(limitStart);
	}

	@Override
	public NoticeBoardDTO noticeRead(int nnum) {
		return mapper.noticeRead(nnum);
	}

	@Override
	public void noticeEdit(String title, String content, String nnum) {
		mapper.noticeEdit(title, content, nnum);
	}

	@Override
	public void noticeDelete(String nnum) {
		mapper.noticeDelete(nnum);
	}

	@Override
	public void noticeInsert(String title, String content) {
		mapper.noticeInsert(title, content);
	}

	@Override
	public int noticeCount() {
		return mapper.noticeCount();
	}

	
}
