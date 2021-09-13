package tw.iiihealth.drugs.model;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import tw.iiihealth.drugs.model.CommentMain;
import tw.iiihealth.membersystem.member.model.Member;

public interface CommentRepository extends JpaRepository<CommentMain, Integer> {
    @Transactional
    @Modifying
    @Query("UPDATE t_comment c SET c.aId = ?1 , c.author = ?2 , c.time = ?3 , c.content = ?4 ,c.memberid = ?5 WHERE c.id = ?6")
    public int updateComment(int aId, String author, String time, String content, int id ,Member member);
    
    @Transactional
    @Modifying
    @Query("from t_comment where memberid = ?1")
    public  List<CommentMain> searchBymemberId(Member memberid);

    @Transactional
    @Modifying
    @Query(value = "insert into t_comment (aid, author, content, memberid) values(#{aId}, #{author}, #{content}, #{memberid})", nativeQuery = true)
    public void insertComment(@Param("aId") Integer aId, @Param("author") String author, @Param("content") String content,@Param("memberid") Member member);
}