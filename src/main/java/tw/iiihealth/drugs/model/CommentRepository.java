package tw.iiihealth.drugs.model;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import tw.iiihealth.drugs.model.CommentMain;

public interface CommentRepository extends JpaRepository<CommentMain, Integer> {
    @Transactional
    @Modifying
    @Query("UPDATE t_comment c SET c.aId = ?1 , c.author = ?2 , c.time = ?3 , c.content = ?4 WHERE c.id = ?5")
    public int updateComment(int aId, String author, String time, String content, int id);


    @Transactional
    @Modifying
    @Query(value = "insert into t_comment (aid, author, content) values(#{aId}, #{author}, #{content})", nativeQuery = true)
    public void insertComment(@Param("aId") Integer aId, @Param("author") String author, @Param("content") String content);
}