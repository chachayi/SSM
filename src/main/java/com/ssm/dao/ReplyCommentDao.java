package com.ssm.dao;

import com.ssm.model.ReplyComment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyCommentDao {
    void insert(@Param("replyComment") ReplyComment replyComment);

    List<ReplyComment> select(int[] commentId);
}
