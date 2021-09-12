package tw.iiihealth.drugs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import tw.iiihealth.drugs.model.CommentMain;
import tw.iiihealth.drugs.model.CommentService;
import tw.iiihealth.drugs.model.Function;

import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @ResponseBody
    @PostMapping("/comment/all")
    public List<CommentMain> findAll() { // 4. 查询所有
    List<CommentMain> list = commentService.findAll(Sort.by(Sort.Direction.DESC,"time"));
    return list;
    }
    public void updateById(int id, int aId, String author, String content) {
        CommentMain commentMain = commentService.findById(id);
        commentMain.setaId(aId);
        commentMain.setAuthor(author);
        commentMain.setContent(content);
        commentMain.setTime(new Function().getDateTime());
        commentService.updateComment(commentMain);
    }

    @ResponseBody
    @RequestMapping(value = "/insertComment", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public String insertComment(@RequestParam("id") int id, @RequestParam("aid") int aId, @RequestParam("author") String author, @RequestParam("content") String content) {
        author = new Function().sqlReplaceAll(author);
        content = new Function().sqlReplaceAll(content);
        if (id != -1) {
            if (aId == 0 && new Function().StringIsNull(author) && new Function().StringIsNull(content)) { // 1. 删除
                commentService.delectCommentById(id);
                return "{\"descr\": \"删除成功\"}";
            } else { // 2. 修改
                updateById(id, aId, author, content);
                return "{\"descr\": \"修改成功\"}";
            }
        } else { // 3. 插入
            CommentMain commentMain = new CommentMain();
            commentMain.setaId(aId);
            commentMain.setAuthor(author);
            commentMain.setContent(content);
            commentMain.setTime(new Function().getDateTime());
            commentService.insertComment(commentMain);
            return "{\"descr\": \"插入成功\"}";
        }
    }

    @GetMapping("/comment")
    public String comment() {
        
        return "comment";
    }
}