package tw.iiihealth.drugs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tw.iiihealth.drugs.model.CommentMain;
import tw.iiihealth.drugs.model.CommentService;
import tw.iiihealth.drugs.model.Drug;
import tw.iiihealth.drugs.model.Function;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
	private MemberService memberService;   
    
    @ResponseBody
    @PostMapping("/comment/all")
    public List<CommentMain> findAll() {
    List<CommentMain> list = commentService.findAll(Sort.by(Sort.Direction.DESC,"time"));
    return list;
    }
    public void updateById(int id, int aId, String author,String content) {
        CommentMain commentMain = commentService.findById(id); 
        commentMain.setaId(aId);
        commentMain.setAuthor(author);
        commentMain.setContent(content);
        commentMain.setTime(new Function().getDateTime());
        commentService.updateComment(commentMain);
    }
    
    @RequestMapping(path="/findallcomment")
	public String ListAllDrug(Model model) {
		List<CommentMain> list = commentService.findAll();
		model.addAttribute("list", list);
		return "drugs/commentmanger";
	}
	
    @RequestMapping(path = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("eId") int eId) {
    	commentService.delete(eId);
		return "redirect:/findallcomment";
	}
    
    
    @RequestMapping(path="/findallcommentfront")
	public String ListAllDrug1(Model model) {
		List<CommentMain> list = commentService.findAll();
		model.addAttribute("list", list);
		return "drugs/commentmanger";
	}
	
    @RequestMapping(path = "deletefront", method = RequestMethod.POST)
	public String delete1(@RequestParam("eId") int eId) {
    	commentService.delete(eId);
		return "redirect:/findallcomment";
	}

    
    @ResponseBody
    @PostMapping("/comment/front")
    public List<CommentMain> searchBymemberId(String memberid) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	Member member = memberService.getCurrentlyLoggedInMember(auth);
    List<CommentMain> commentMainList = commentService.searchBymemberId(member);
    return commentMainList;
    }
    
    @PostMapping("/comment/delet")
    public void delectById(int id) {
    	commentService.delectCommentById(id);
    }

   
    @ResponseBody
    @RequestMapping(value = "/comment/insertComment", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String insertComment(@RequestParam("id") int id, @RequestParam("aid") int aId, @RequestParam("author") String author, @RequestParam("content") String content) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	Member member = memberService.getCurrentlyLoggedInMember(auth);
    	System.out.println(auth);
    	author = new Function().sqlReplaceAll(author);
        content = new Function().sqlReplaceAll(content);
        
        if (id != -1) {
            if (aId == 0 && new Function().StringIsNull(author) && new Function().StringIsNull(content)) { // 1. 删除
                commentService.delectCommentById(id);
                return null;
        } else { // 2. 修改
                updateById(id, aId, author, content);
                return null;
            }
        } else { // 3. 插入
        	
            CommentMain commentMain = new CommentMain();
            commentMain.setaId(aId);
            commentMain.setAuthor(author);
            commentMain.setContent(content); 
            commentMain.setTime(new Function().getDateTime());
            commentMain.setMemberid(member);
            commentService.insertComment(commentMain);
             return null;
        }
    }

    @GetMapping("/comment")
    public String comment() {
        
        return "drugs/comment";
    }


@GetMapping("/comment/commentfront")
public String comment1() {
    
    return "drugs/commentfront";
}
}