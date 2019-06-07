package com.ssm.dao;

import com.ssm.model.Article;

import java.util.Date;
import java.util.List;

public interface ArticleDao {

    List<Article> selectAll(int index);

    List<Article> selectAllByCount(int index);

    List<Article> selectByCategory(String category);

    List<Article> selectByTime(String time);

    List<Article> popularArticles();

    List<Article> searchNotes(String title);

    Article articleDetails(int articleId);

    void addCount(int articleId);
}
