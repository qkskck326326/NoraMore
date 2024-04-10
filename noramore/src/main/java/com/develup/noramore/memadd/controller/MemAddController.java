package com.develup.noramore.memadd.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.develup.noramore.freeboard.model.service.FreeBoardService;
import com.develup.noramore.freeboard.model.vo.FreeBoard;
import com.develup.noramore.memadd.model.service.MemAddService;
import com.develup.noramore.memadd.model.vo.MemAdd;
import com.develup.noramore.recrboard.model.service.RecrBoardService;
import com.develup.noramore.recrboard.model.vo.RecrBoard;

import net.sf.json.JSONArray;


@Controller
public class MemAddController {

	
	@Autowired
	private MemAddService memAddService;
	
	@Autowired
	private RecrBoardService recrBoardService;
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	
	//등급페이지로 이동
	@RequestMapping(value = "grade.do", method = { RequestMethod.GET, RequestMethod.POST })
	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
	public String gradePage(@RequestParam("memberID") String memberid, Model model) {
		System.out.println("memberid : " + memberid);
		
		MemAdd memAdd = memAddService.selectMemAdd(memberid);
		
		System.out.println("memAdd : " + memAdd);
		if (memAdd != null) { 
			model.addAttribute("memAdd", memAdd); // 꺼낼 때는 여기서 저장한 이름으로 꺼냄
			return "member/gradePage";
		} else {
			return "redirect:home.do";
		}
	}


	//활동기록 페이지로 이동 >> 회원의 모집게시판
	@RequestMapping(value = "selectRecrBoadMemberId.do", method = { RequestMethod.GET, RequestMethod.POST })
	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
	public String articleRecrListPage(@RequestParam("memberID") String memberid, Model model) {
		System.out.println("memberid : " + memberid);
		System.out.println();
		ArrayList<RecrBoard> recrBoardList = recrBoardService.selectRecrBoardId(memberid);
		
		System.out.println("list : " + recrBoardList);
		if (recrBoardList != null) { 
			model.addAttribute("list", recrBoardList); // 꺼낼 때는 여기서 저장한 이름으로 꺼냄
			return "member/myArticlePage";
		} else {
			return "redirect:home.do";
		}
	}

//	//회원의 자유게시판
//	@RequestMapping(value = "selectFreeBoadMemberId.do", method = { RequestMethod.GET, RequestMethod.POST })
//	// RequestMethod.GET : get방식으로 전송오면 받음, RequestMethod.POST : post방식으로 전송오면 받음
//	public String articleFreeListPage(@RequestParam("memberID") String memberid, Model model) {
//		System.out.println("memberid : " + memberid);
//		System.out.println();
//		ArrayList<FreeBoard> freeBoardList = freeBoardService.selectfreeBoardId(memberid);
//		
//		System.out.println("list : " + freeBoardList);
//		if (freeBoardList != null) { 
//			model.addAttribute("list", freeBoardList); // 꺼낼 때는 여기서 저장한 이름으로 꺼냄
//			return "member/myArticlePage";
//		} else {
//			return "redirect:home.do";
//		}
//	}


	
	@RequestMapping(value="selectFreeBoadMemberId.do", method={ RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody      //response 객체에 JSONString 담아 보내기 위함
	   public String articleFreeListPage(@RequestParam("memberID") String memberid, Model model) throws UnsupportedEncodingException {
	        
		System.out.println("memberid : " + memberid);
		  ArrayList<FreeBoard> freeBoardList = freeBoardService.selectfreeBoardId(memberid);
	      
	      //list를 json 배열로 옮기기
	      JSONArray jarr = new JSONArray();         //import 시 org.json.simple.JSONArray 와
	      for(FreeBoard fboard : freeBoardList) {
	         //board 객체 저장용 json 객체 생성
	         JSONObject job = new JSONObject();
	         job.put("flikeCount", fboard.getLikeCount());
	         //한글에 대해서는 인코딩해서 json에 담음 (한글 깨짐 방지)
	         job.put("ftitle", URLEncoder.encode(fboard.getTitle(), "utf-8"));
	      // 날짜 데이터는 반드시 문자열로 바꿔서 저장할 것 : 날짜 그대로 저장하면 뷰에서 json 전체가 출력이 안됨 >> 날짜를 기록한
	 		// json객체는 출력이 안됨
	 		job.put("fregist", fboard.getRegistDate().toString());
	 		job.put("fboardId", fboard.getBoardId());
			/* job.put("fregist", fboard.getPage()); */
	 		job.put("categoryId", fboard.getCategoryId());
	  
	         //job 를 jarr 에 추가
	         jarr.add(job);
	      }
	      
	      //전송용 json 객체 준비
	      JSONObject sendJson = new JSONObject();
	      //전송용 객체에 jarr 담음
	      sendJson.put("list", jarr);
	      
	      //전송용 json 을 JSONString 으로 전송
	      return sendJson.toJSONString();
	   }




//	@RequestMapping(value = "gradeImage.do", method = RequestMethod.POST)
//	public void dupCheckId(@RequestParam("memberid") String memberid, HttpServletResponse response) throws IOException {
//
//		
//		System.out.println("memberid!!!1 : memberid ");
//		
//		String returnStr = null;
//		MemAdd memAdd = memAddService.selectMemAdd(memberid);
//		int actCount = memAdd.getArticleCount();
//		System.out.println("actCount : " + actCount);
//		
//		if(memberid.length() > 0) {
//			returnStr = "null";
//			
//		}else {
//			if (actCount > 0 && actCount < 31) {
//				returnStr = "sprout";
//			} else if(actCount > 30 && actCount < 51) {
//				returnStr = "grass";
//			}else if(actCount > 50 && actCount < 71) {
//				returnStr = "flower";
//			}else if(actCount > 70 && actCount < 91) {
//				returnStr = "tree";
//			}else {
//				returnStr = "forest";
//			}
			
			
//		}
//		// response 를 이용해서 클라이언트와 출력스트림을 열어서 문자열값 내보냄
//		response.setContentType("text/html; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.append(returnStr);
//		out.flush();
//		out.close();
//	}
//

	
	
	
	
	
	
	
}
