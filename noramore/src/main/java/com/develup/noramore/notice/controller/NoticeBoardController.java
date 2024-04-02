package com.develup.noramore.notice.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.develup.noramore.common.FileNameChange;
import com.develup.noramore.common.Paging;
import com.develup.noramore.notice.model.service.NoticeBoardService;
import com.develup.noramore.notice.model.vo.Notice;

@Controller
public class NoticeBoardController {
	// 로그 객체 로거 생성
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);

	@Autowired
	private NoticeBoardService noticeBoardService;

	@RequestMapping("noticewrite.do")
	public String insertNoticeBoard() {
		return "notice/noticewrite";
	}//

	@RequestMapping("notice.do")
	public String selectNoticeBoard() {

		return "notice/notice";
	}

	@RequestMapping("nlist.do")
	public String noticeListMethod(@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지 공지 10개씩 출력되게 한다면
		int limit = 10;
		if (slimit != null) {
			limit = Integer.parseInt(slimit);
		}

		// 총 페이지 수 계산을 위한 공지글 총갯수 조회
		int listCount = noticeBoardService.selectListCount();
		// 페이지 관련 항목 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "nlist.do");
		paging.calculate();

		// 페이지에 출력할 목록 조회해 옴
		ArrayList<Notice> list = noticeBoardService.selectList(paging);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);

			return "notice/notice";
		} else {
			model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
			return "common/error";
		}
	}

	@RequestMapping("noticedetail.do")
	public ModelAndView noticeDetailMethod(@RequestParam("no") int noticeno, ModelAndView mv, HttpSession session) {

		Notice notice = noticeBoardService.selectOne(noticeno);

		noticeBoardService.updateAddReadCount(noticeno);

		if (notice != null) {
			mv.addObject("notice", notice);

			mv.setViewName("notice/noticedetail");
		}

		return mv;
	}

	// 새 공지글 등록 요청 처리용 (파일 업로드 기능 추가)

	@RequestMapping(value = "ninsert.do", method = RequestMethod.POST)
	public String noticeInsertMethod(Notice notice, Model model, HttpServletRequest request,
			@RequestParam(name = "ofile", required = false) MultipartFile mfile) {
		logger.info("ninsert.do : " + notice);

		if (notice.getMemberId() == null) {
			notice.setMemberId("guest");
		}

		// 공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = "resources/notice_upfiles"; // 상대 경로 사용

		// 서버상의 실제 경로를 얻어옴
		String realPath = request.getSession().getServletContext().getRealPath("/");
		File uploadDir = new File(realPath, savePath);

		// 업로드 디렉토리가 존재하지 않으면 생성
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// 첨부파일이 있을 때
		if (mfile != null && !mfile.isEmpty()) {
			// 전송된 파일 이름 추출
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;

			// 파일 이름 변경
			if (fileName != null && fileName.length() > 0) {
				// 변경된 파일명 생성
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);

				try {
					// 파일 저장
					mfile.transferTo(new File(uploadDir, renameFileName));

					// 공지사항 객체에 파일 정보 저장
					notice.setOriginalFilePath(fileName);
					notice.setRenameFilePath(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패!");
					return "common/error";
				}
			}
		}

		// 공지사항 등록 처리
		if (noticeBoardService.insertNotice(notice) > 0) {
			// 공지글 등록 성공시 목록 보기 페이지로 이동
			return "redirect:nlist.do";
		} else {
			model.addAttribute("message", "새 공지글 등록 실패!");
			return "common/error";
		}
	}
	
	//공지글 삭제 요청 처리용
	@RequestMapping("ndelete.do")
	public String noticeDeleteMethod(
			@RequestParam("noticeno") int noticeno,
			@RequestParam(name="rfile", required=false) String renameFileName,
			HttpServletRequest request, Model model) {
		
		if(noticeBoardService.deleteNotice(noticeno) > 0) {
			//공지글 삭제 성공시 저장 폴더에 있는 첨부파일도 삭제함
			if(renameFileName != null) {
				//공지사항 첨부파일 저장 폴더 경로 지정
				String savePath = request.getSession().getServletContext().getRealPath(
						"resources/notice_upfiles");
				//저장 폴더에서 파일 삭제함
				new File(savePath + "\\" + renameFileName).delete();
			}
			
			return "redirect:nlist.do";
		}else {
			model.addAttribute("message", noticeno + "번 공지 삭제 실패!");
			return "common/error";
		}
	}
}
