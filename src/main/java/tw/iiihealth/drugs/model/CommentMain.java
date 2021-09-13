package tw.iiihealth.drugs.model;

import javax.persistence.*;

import tw.iiihealth.elder.model.Order;
import tw.iiihealth.elder.model.OrderDetail;
import tw.iiihealth.membersystem.member.model.Member;
import tw.iiihealth.membersystem.member.model.*;

import java.io.Serializable;
import java.util.List;

/**
 * 评论实体类
 */

@Entity(name = "t_comment")
public class CommentMain implements Serializable  {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2486565725709434638L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String content;

    private String author;

    private String time;

    @Column(name = "a_id")
    private Integer aId;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }


	@ManyToOne(cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name="memberid")
	private Member memberid;
    
    
    public Member getMemberid() {
		return memberid;
	}

	public void setMemberid(Member memberid) {
		this.memberid = memberid;
	}

	@Override
    public String toString() {
        return "{" +
                "\"id\": " + id +
                ", \"content\":\"" + content + "\"" +
                ", \"author\": \"" + author + "\"" +
                ", \"time\": \"" + time + "\"" +
                ", \"aId\": " + aId +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }
}