package club.sajor.roadqu.comment.service.impl;

import club.sajor.roadqu.comment.dao.CommentDao;
import club.sajor.roadqu.comment.model.Comment;
import club.sajor.roadqu.comment.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> selectCommentByTmid(String tmid) {
        List<Comment> commentList = commentDao.selectCommentByTmid(tmid);
        return commentList;
    }

    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }
}
