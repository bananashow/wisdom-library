package library.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import library.DTO.BookListDTO;
import library.DTO.BookRentalListDTO;
import library.DTO.FreeBoardDTO;
import library.DTO.HopeListDTO;
import library.DTO.MemberDTO;
import library.DTO.NoticeBoardDTO;
import library.service.BookListService;
import library.service.BookRentalListService;
import library.service.FreeBoardService;
import library.service.HopeListService;
import library.service.MemberService;
import library.service.NoticeBoardService;

@Controller
@RequestMapping("/*.do")
public class LibraryController {
	
	HttpSession session;

	@Autowired
	MemberService mservice;
	
	@Autowired
	BookListService bservice;
	
	@Autowired
	FreeBoardService fservice;
	
	@Autowired
	HopeListService hservice;
	
	@Autowired
	BookRentalListService rservice;
	
	@Autowired
	NoticeBoardService nservice;
	
	//메인 화면
	@RequestMapping("/index.do")
	public String indexGo() {
		return "index";
	}
	
	//이 달의 추천 도서
	@RequestMapping("/recommendBooks.do")
	public String recommendBooksGo() {
		return "recommendBooks";
	}
	
	
	//로그인
	@RequestMapping("/login.do")
	public String loginGo() {
		return "login";
	}
	
	@RequestMapping(value = "/login_process.do", method = RequestMethod.POST)
	public String login_processGo(@RequestParam("id") String id, @RequestParam("pw") String pw, Model model) {
		model.addAttribute("inputId", id);
		model.addAttribute("inputPw", pw);
		
		MemberDTO memberLogin = mservice.memberLogin(id);
		model.addAttribute("memberLogin", memberLogin);
		return "login_process";
	}
	
	
	//로그아웃
	@RequestMapping("/logout.do")
	public String logoutGo() {
		return "logout";
	}
	
	//회원 가입
	@RequestMapping("/register.do")
	public String registerGo() {
		return "register";
	}
	
	@RequestMapping(value = "/register_process.do", method = RequestMethod.POST)
	public String register_processGo(@RequestParam("id") String id, @RequestParam("pw") String pw, @RequestParam("name") String name, @RequestParam("email") String email) {
		mservice.memberInsert(id, pw, name, email);	
		return "register_process";
	}
	
	
	
	//자료 검색
	@RequestMapping("/bookSearch.do")
	public String bookSearchGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = bservice.countBoard();
		model.addAttribute("bCount", bCount);
		return "bookSearch_process";
	}
	
	@RequestMapping("/bookSearch_process.do")
	public String bookSearch_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<BookListDTO> list = bservice.list(limitStart);
		model.addAttribute("list", list);
		model.addAttribute("totalPage", totalPage);
		return "bookSearch";
	}
	
	//도서 찾기
	@RequestMapping("/searchBook.do")
	public String searchFromId(@RequestParam("search") String search, @RequestParam("searchText") String searchText, Model model) {
		
		if (search.equals("booktitle")) {
			search = "booktitle";
		} else {
			search = "author";
		}
		System.out.println(search);
		System.out.println(searchText);
		
		ArrayList<BookListDTO> searchList = bservice.searchbook(search, searchText);
		model.addAttribute("list", searchList);
		
		return "searchBook_process";
	}
	
	//책 대여하기
	@RequestMapping("/bookRental.do")
	public String bookRentalGo(@RequestParam("isbn") String isbn, @RequestParam("id") String id) {
		//재고 수 -1 처리
		bservice.bookStock(isbn);
		// 대여 리스트(isbn, booktitle / id, name, email, rentaldate)에 추가
		BookListDTO bookinfo = bservice.bookInfo(isbn);
		String booktitle = bookinfo.getBooktitle();
		
		MemberDTO userinfo = mservice.memberLogin(id);
		String name = userinfo.getName();
		String email = userinfo.getEmail();
		
		rservice.rentalBookInsert(isbn, booktitle, id, name, email);

		return "redirect:readMore.do?isbn="+isbn;
	}
	
	
	//대여 도서 목록
	@RequestMapping("/myRentalBook.do")
	public String myRentalBookGo(@RequestParam("id") String id, Model model) {
		ArrayList<BookRentalListDTO> rentList = rservice.rentalList(id);
		model.addAttribute("rentList", rentList);
		return "myRentalBook";
	}

	
	//회원 정보 수정
	@RequestMapping("/memberEdit.do")
	public String memberEditGo(@RequestParam("id") String id, Model model) {
		MemberDTO member = mservice.memberLogin(id);
		model.addAttribute("member", member);
		return "memberEdit";
	}
	
	@RequestMapping("/memberEdit_process.do")
	public String memberEdit_processGo(@RequestParam("id") String id, @RequestParam("pw") String pw, @RequestParam("name") String name,  @RequestParam("email") String email) {
		mservice.memberEdit(id, pw, name, email);
		return "redirect:index.do";
	}
	
	
	
	//자유 게시판 리스트
	@RequestMapping("/freeBoard.do")
	public String freeBoardGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = fservice.countBoard();
		model.addAttribute("bCount", bCount);
		return "freeBoard_process";
	}
	
	@RequestMapping("/freeBoard_process.do")
	public String freeBoard_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<FreeBoardDTO> bList = fservice.freeBoardList(limitStart);
		model.addAttribute("bList", bList);
		model.addAttribute("totalPage", totalPage);
		return "freeBoard";
	}
	
	
	//자유 게시판 게시글 찾기
	@RequestMapping("/searchBoard.do")
	public String searchBoardGo(@RequestParam("search") String search, @RequestParam("searchText") String searchText, Model model) {
		
		if (search.equals("title")) {
			search = "title";
		} else {
			search = "id";
		}
		System.out.println(search);
		System.out.println(searchText);
		
		ArrayList<FreeBoardDTO> bList = fservice.searchbook(search, searchText);
		model.addAttribute("bList", bList);
		
		return "searchBoard_process";
	}
	
	
	//자유게시판 글쓰기
	@RequestMapping("/freeBoardWrite.do")
	public String freeBoardWriteGo() {
		return "freeBoardWrite";
	}
	
	@RequestMapping("/write_process.do")
	public String write_processGo(@RequestParam("id") String id, @RequestParam("title") String title, @RequestParam("content") String content) {
		fservice.boardWrite(id, title, content);
		return "redirect:freeBoard.do";
	}
	
	//자유게시판 글 자세히보기
	@RequestMapping("/freeBoardReadMore.do")
	public String readMoreGo(@RequestParam("bnum") int bnum, Model model) {
		FreeBoardDTO read = fservice.boardReadMore(bnum);
		//조휘수 +1
		fservice.freeBoardHits(bnum);
		model.addAttribute("read", read);
		return "freeBoardReadMore";
	}
	
	//자유게시판 글 수정
	@RequestMapping(value = "/freeBoardEdit.do", method = RequestMethod.POST)
	public String freeBoardEditGo(@RequestParam("bnum") int bnum, @RequestParam("title") String title, @RequestParam("content") String content) {
		fservice.freeBoardEdit(title, content, bnum);
		return "redirect:freeBoard.do";
	}
	
	//자유게시판 글 삭제
	@RequestMapping("/freeboardDelete.do")
	public String freeboardDeleteGo(@RequestParam("bnum") int bnum) {
		fservice.freeBoardDelete(bnum);
		return "redirect:freeBoard.do";
	}
	
	
	
	//희망 도서 신청
	@RequestMapping("/hopeBook.do")
	public String hopeBookGo() {
		return "hopeBook";
	}
	
	//희망 도서 신청 처리
	@RequestMapping("/hopeBook_process.do")
	public String hopeBook_processGo(@RequestParam("id") String id, @RequestParam("isbn") String isbn, @RequestParam("booktitle") String booktitle, @RequestParam("author") String author, @RequestParam("link") String link) {
		hservice.hopeListAdd(id, isbn, booktitle, author, link);
		return "hopeBook_process";
	}
	
	//도서 자세히 보기
	@RequestMapping("/readMore.do")
	public String readMoreGo(@RequestParam("isbn") String isbn, Model model) {
		String bookStockNum = bservice.bookStockNum(isbn);
		model.addAttribute("bookStockNum", bookStockNum);
		return "readMore/read_"+isbn;
	}
	
	
	//공지사항 보기
	@RequestMapping("/notice.do")
	public String noticeGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = nservice.noticeCount();
		model.addAttribute("bCount", bCount);
		return "notice_process";
	}
	
	@RequestMapping("/notice_process.do")
	public String notice_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<NoticeBoardDTO> nList = nservice.noticeList(limitStart);
		model.addAttribute("nList", nList);
		model.addAttribute("totalPage", totalPage);
		return "notice";
	}
	
	
	
	
	
	
	//공지사항 자세히 보기
	@RequestMapping("/noticeReadMore.do")
	public String noticeReadMoreGo(@RequestParam("nnum") int nnum, Model model) {
		NoticeBoardDTO noticeRead = nservice.noticeRead(nnum);
		model.addAttribute("noticeRead", noticeRead);
		return "noticeReadMore";
	}
	
	
	
	
//	------------------------------------------ 관리자 페이지 ----------------------------------------------------
	
	//관리자 메인 화면
	@RequestMapping("/admin_index.do")
	public String admin_indexGo() {
		return "admin_index";
	}
	
	//관리자 도서 리스트
	@RequestMapping("/admin_bookList.do")
	public String admin_bookListGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = bservice.countBoard();
		model.addAttribute("bCount", bCount);
		return "admin_bookList_process";
	}
	
	@RequestMapping("/admin_bookList_process.do")
	public String admin_bookList_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<BookListDTO> list = bservice.list(limitStart);
		model.addAttribute("list", list);
		model.addAttribute("totalPage", totalPage);
		return "admin_bookList";
	}
	
	//관리자 도서 찾기
	@RequestMapping("/admin_searchBook.do")
	public String admin_searchBook(@RequestParam("search") String search, @RequestParam("searchText") String searchText, Model model) {
		
		if (search.equals("booktitle")) {
			search = "booktitle";
		} else {
			search = "author";
		}
		System.out.println(search);
		System.out.println(searchText);
		
		ArrayList<BookListDTO> searchList = bservice.searchbook(search, searchText);
		model.addAttribute("list", searchList);
		
		return "admin_searchBook_process";
	}
	
	//관리자 도서 수정 페이지
	@RequestMapping("/admin_bookEdit.do")
	public String admin_bookEditGo(@RequestParam("isbn") String isbn, Model model) {
		BookListDTO bookinfo = bservice.bookInfo(isbn);
		model.addAttribute("bookinfo", bookinfo);
		return "admin_bookEdit";
	}
	
	//관리자 도서 수정 처리
	@RequestMapping("/admin_bookEdit_process.do")
	public String admin_bookEdit_processGo(@RequestParam("isbn") String isbn, @RequestParam("booktitle") String booktitle, @RequestParam("author") String author, @RequestParam("genre") String genre, @RequestParam("company") String company,  @RequestParam("stock") int stock) {
		bservice.bookInfoEdit(isbn, booktitle, author, genre, company, stock);
		return "redirect:admin_bookList.do";
	}
	
	//관리자 도서 삭제 처리
	@RequestMapping("/admin_bookDelete.do")
	public String admin_bookEdit_processGo(@RequestParam("isbn") String isbn) {
		bservice.bookDelete(isbn);
		return "redirect:admin_bookList.do";
	}
	
	//관리자 도서 추가
	@RequestMapping("/admin_bookAdd.do")
	public String admin_bookAddGo() {
		return "admin_bookAdd";
	}
	
	@RequestMapping("/admin_bookAdd_process.do")
	public String admin_bookAdd_processGo(@RequestParam("isbn") String isbn, @RequestParam("booktitle") String booktitle, @RequestParam("author") String author, @RequestParam("genre") String genre, @RequestParam("company") String company, @RequestParam("stock") int stock) {
		bservice.bookAdd(isbn, booktitle, author, genre, company, stock);
		return "redirect:admin_bookList.do";
	}
	
	//관리자 회원 리스트
	@RequestMapping("/admin_memberList.do")
	public String admin_memberListGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = mservice.memberCount();
		model.addAttribute("bCount", bCount);
		return "admin_memberList_process";
	}
	
	@RequestMapping("/admin_memberList_process.do")
	public String admin_memberList_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<MemberDTO> memberlist = mservice.memberList(limitStart);
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("totalPage", totalPage);
		return "admin_memberList";
	}
	

	//관리자 회원 특이사항 저장
	@RequestMapping(value = "/admin_memberOtherSave.do", method = RequestMethod.POST)
	public String admin_memberOtherSaveGo(@RequestParam("id") String id, @RequestParam("other") String other) {
		mservice.memberOther(id, other);
		return "redirect:admin_memberList.do";
	}
	
	
	
	//관리자 회원 찾기
	@RequestMapping("/admin_searchMember.do")
	public String admin_searchMemberGo(@RequestParam("search") String search, @RequestParam("searchText") String searchText, Model model) {
		
		if (search.equals("id")) {
			search = "id";
		} else {
			search = "name";
		}
		System.out.println(search);
		System.out.println(searchText);
		
		ArrayList<MemberDTO> searchList = mservice.searchMember(search, searchText);
		model.addAttribute("memberlist", searchList);
		
		return "admin_searchMember_process";
	}
	
	//관리자 회원희망도서 리스트
	@RequestMapping("/admin_memberHopeBook.do")
	public String admin_memberHopeBookGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = hservice.hopeBookCount();
		model.addAttribute("bCount", bCount);
		return "admin_memberHopeBook_process";
	}
	
	@RequestMapping("/admin_memberHopeBook_process.do")
	public String admin_memberHopeBook_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<HopeListDTO> hopeList = hservice.hopeList(limitStart);
		model.addAttribute("hopeList", hopeList);
		model.addAttribute("totalPage", totalPage);
		return "admin_memberHopeBook";
	}
	
	
	
	
	
	
	
	//관리자 회원희망도서 삭제
	@RequestMapping("/admin_memberHopeBookDelete.do")
	public String admin_memberHopeBookDeleteGo(@RequestParam("hnum") String hnum) {
		hservice.hopeDelete(hnum);
		return "redirect:admin_memberHopeBook.do";
	}
	
	
	//관리자 자유게시판 관리
	@RequestMapping("/admin_freeBoard.do")
	public String admin_freeBoardGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = fservice.countBoard();
		model.addAttribute("bCount", bCount);
		return "admin_freeBoard_process";
	}
	
	@RequestMapping("/admin_freeBoard_process.do")
	public String admin_freeBoard_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<FreeBoardDTO> bList = fservice.freeBoardList(limitStart);
		model.addAttribute("bList", bList);
		model.addAttribute("totalPage", totalPage);
		return "admin_freeBoard";
	}
	
	
	//관리자 자유게시판 게시글 찾기
	@RequestMapping("/admin_searchBoard.do")
	public String admin_searchBoardGo(@RequestParam("search") String search, @RequestParam("searchText") String searchText, Model model) {
		
		if (search.equals("title")) {
			search = "title";
		} else {
			search = "id";
		}
		System.out.println(search);
		System.out.println(searchText);
		
		ArrayList<FreeBoardDTO> bList = fservice.searchbook(search, searchText);
		model.addAttribute("bList", bList);
		
		return "admin_searchBoard_process";
	}
	
	//관리자 자유게시판에서 회원글 삭제 처리
	@RequestMapping("/admin_deleteBoard.do")
	public String admin_deleteBoardGo(@RequestParam("bnum") int bnum) {
		fservice.freeBoardDelete(bnum);
		return "redirect:admin_freeBoard.do";
	}
	
	//관리자 공지사항 관리
	@RequestMapping("/admin_notice.do")
	public String admin_noticeGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = nservice.noticeCount();
		model.addAttribute("bCount", bCount);
		return "admin_notice_process";
	}
	
	@RequestMapping("/admin_notice_process.do")
	public String admin_notice_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<NoticeBoardDTO> nList = nservice.noticeList(limitStart);
		model.addAttribute("nList", nList);
		model.addAttribute("totalPage", totalPage);
		return "admin_notice";
	}
	
	//관리자 공지사항 글쓰기
	@RequestMapping("/admin_noticeWrite.do")
	public String admin_noticeWriteGo() {
		return "admin_noticeWrite";
	}
	
	@RequestMapping("/admin_noticewrite_process.do")
	public String admin_noticewrite_processGo(@RequestParam("title") String title, @RequestParam("content") String content) {
		nservice.noticeInsert(title, content);
		return "redirect:admin_notice.do";
	}
	
 	
	//관리자 공지사항 자세히보기
	@RequestMapping("/admin_noticeReadMore.do")
	public String admin_noticeReadMoreGo(@RequestParam("nnum") int nnum, Model model) {
		NoticeBoardDTO noticeRead = nservice.noticeRead(nnum);
		model.addAttribute("noticeRead", noticeRead);
		return "admin_noticeReadMore";
	}
	
	//관리자 공지사항 수정
	@RequestMapping("/admin_noticeEdit.do")
	public String admin_noticeEditGo(@Param("nnum") String nnum, @Param("title") String title, @Param("content") String content) {
		nservice.noticeEdit(title, content, nnum);
		return "redirect:admin_noticeReadMore.do?nnum="+nnum;
	}
	
	//관리자 공지사항 삭제
	@RequestMapping("/admin_noticeDelete.do")
	public String admin_noticeDeleteGo(@RequestParam("nnum") String nnum) {
		nservice.noticeDelete(nnum);
		return "redirect:admin_notice.do";
	}
	
	
	
	//관리자 대여 도서 관리
	@RequestMapping("/admin_rentalBook.do")
	public String admin_rentalBookGo(Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {
		model.addAttribute("nowPage", nowPage);
		
		int bCount = rservice.rentalBookCount();
		model.addAttribute("bCount", bCount);
		return "admin_rentalBook_process";
	}
	
	@RequestMapping("/admin_rentalBook_process.do")
	public String admin_rentalBook_processGo(Model model, @RequestParam("limitStart") int limitStart, @RequestParam("totalPage") int totalPage) {
		ArrayList<BookRentalListDTO> rentListAll = rservice.rentalListAll(limitStart);
		model.addAttribute("rentListAll", rentListAll);
		model.addAttribute("totalPage", totalPage);
		return "admin_rentalBook";
	}
	
	
	//관리자 도서 반납처리
	@RequestMapping("/admin_return.do")
	public String admin_returnGo(@RequestParam("rnum") int rnum, @RequestParam("isbn") String isbn) {
		rservice.returnBook(rnum);
		bservice.bookStockPlus(isbn);
		return "redirect:admin_rentalBook.do";
	}
	
	
	//대여한 회원 아이디 / 도서명으로 찾기
	@RequestMapping("/admin_rentalBookSearch.do")
	public String admin_rentalBookSearchGo(@RequestParam("search") String search, @RequestParam("searchText") String searchText, Model model) {
		
		if (search.equals("booktitle")) {
			search = "booktitle";
		} else {
			search = "id";
		}
		System.out.println(search);
		System.out.println(searchText);
		
		ArrayList<BookRentalListDTO> rentList = rservice.rentBookSearch(search, searchText);
		model.addAttribute("rentList", rentList);
		
		return "admin_rentalBookSearch_process";
	}
}
