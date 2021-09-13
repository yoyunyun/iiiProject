package tw.iiihealth.drugs.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import tw.iiihealth.drugs.model.CommentMain;
import tw.iiihealth.drugs.model.CommentRepository;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.service.MemberService;

import java.util.List;
import java.util.Optional;

@Service
@CacheConfig(cacheNames = "comment")

public class CommentService { 
    @Autowired
    private CommentRepository commentRepository;

    // 如果结果为空，就查询数据库，并且以comment-all的身份保存在缓存中
    @Cacheable(key = "'comment-all'", unless = "#result==null")
    public List<CommentMain> findAll(Sort sort) {
    	
        List<CommentMain> commentMainList = commentRepository.findAll(sort);
        return commentMainList;
    }
    
    public CommentMain findById(int eid) {
		Optional<CommentMain> commentMainList = commentRepository.findById(eid);
		return commentMainList.get();
	}
	
  

    // 其中#p0的意思是注解的方法中的第一个参数
    //该注解用于清楚cacheNames下的所有缓存
    //使用@CacheEvict目的是为了清空重新读取实时更新
    @CacheEvict(key = "#p0.id", allEntries = true)
    public CommentMain updateComment(CommentMain commentMain) {
        commentRepository.updateComment(commentMain.getaId(), commentMain.getAuthor(), commentMain.getTime(), commentMain.getContent(), commentMain.getId(),commentMain.getMemberid());
        return commentMain;
    }

    @CacheEvict(key = "#p0", allEntries = true)
    //@CacheEvict(key="'comment-'+ #p0")
    public void delectCommentById(int id) {
        commentRepository.deleteById(id);
    }

    // 插入一条数据
    @CacheEvict(allEntries = true)
    //@CachePut(key="'comment-'+ #p0.id")
    public void insertComment(CommentMain commentMain) {
        commentRepository.save(commentMain);
    }

    public  List<CommentMain> searchBymemberId(Member memberid) {
    	System.out.println(memberid);
    	System.out.println("----------------------------------");
    	 List<CommentMain> commentMainList = commentRepository.searchBymemberId(memberid);
      return commentMainList;
    }
    
}