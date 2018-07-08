package club.sajor.roadqu.comment.dao;

import club.sajor.roadqu.comment.model.Comment;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import java.util.List;

public interface CommentDao {

    @Select("select c.*, u.* from users u, comment c where u.userid = c.userid and memoryid = #{tmid} order by commentdate desc")
    List<Comment> selectCommentByTmid(String tmid);

    @SelectKey(statement = "select replace(uuid(), '-', '')", before = true, keyColumn = "commentid", keyProperty = "commentid", resultType = String.class)
    @Insert("insert into comment values(#{commentid}, #{userid}, #{commentcontent}, #{commentdate}, #{memoryid})")
    void addComment(Comment comment);
}
