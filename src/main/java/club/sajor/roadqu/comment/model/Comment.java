package club.sajor.roadqu.comment.model;

import club.sajor.roadqu.user.model.User;

import java.util.Date;

public class Comment extends User {
    private String commentid;
    private String commentcontent;
    private Date commentdate;
    private String memoryid;

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent;
    }

    public Date getCommentdate() {
        return commentdate;
    }

    public void setCommentdate(Date commentdate) {
        this.commentdate = commentdate;
    }

    public String getMemoryid() {
        return memoryid;
    }

    public void setMemoryid(String memoryid) {
        this.memoryid = memoryid;
    }
}
