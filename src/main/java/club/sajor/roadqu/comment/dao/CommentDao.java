package club.sajor.roadqu.comment.dao;

import club.sajor.roadqu.comment.model.Comment;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CommentDao {

    @Select("select c.*, u.* from users u, comment c where u.userid = c.userid and memoryid = #{tmid}")
    List<Comment> selectCommentByTmid(String tmid);
}
