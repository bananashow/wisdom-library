package library.serviceImp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.DTO.HopeListDTO;
import library.mapper.HopeListMapper;
import library.service.HopeListService;

@Service
public class HopeListServiceImp implements HopeListService {

	@Autowired
	HopeListMapper mapper;

	@Override
	public void hopeListAdd(String id, String isbn, String booktitle, String author, String link) {
		mapper.hopeListAdd(id, isbn, booktitle, author, link);
	}

	@Override
	public ArrayList<HopeListDTO> hopeList(int limitStart) {
		return mapper.hopeList(limitStart);
	}

	@Override
	public void hopeDelete(String hnum) {
		mapper.hopeDelete(hnum);
	}

	@Override
	public int hopeBookCount() {
		return mapper.hopeBookCount();
	}
	
	
}
