package club.sajor.roadqu.comment.service;

import club.sajor.roadqu.comment.model.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> selectCommentByTmid(String tmid);
}
