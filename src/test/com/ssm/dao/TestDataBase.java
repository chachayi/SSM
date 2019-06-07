package com.ssm.dao;

import com.ssm.model.Comment;
import com.ssm.service.CommentService;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestDataBase {

    @Autowired
    ReplyCommentDao replyCommentDao;

    @Autowired
    CommentDao commentDao;

    @Autowired
    CommentService commentService;

    private List<String> banWords = new ArrayList<String>(); // 禁用词


    public void testSelectUser() throws Exception {
        String path = this.getClass().getClassLoader().getResource("sensitive-words/words.txt").getPath();
        //File file = new File(path);
        InputStreamReader reader = new InputStreamReader(new FileInputStream(path),"UTF-8");
        //FileReader reader = new FileReader(path);
        BufferedReader br = new BufferedReader(reader);
        String line = null;
        while ((line = br.readLine()) != null) {
            String[] s = line.split("\\|");
            banWords.add(s[0].trim());
        }
        br.close();
    }

    public SqlSessionFactory getSqlSessionFactory() throws IOException{
        String resource = "mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        return  new SqlSessionFactoryBuilder().build(inputStream);
    }


    @Test
    public void test() throws Exception {
        SqlSessionFactory sqlSessionFactory = getSqlSessionFactory();
        SqlSession openSession = sqlSessionFactory.openSession();
        SqlSession openSession2= sqlSessionFactory.openSession();
        try{
            CommentDao mapper = openSession.getMapper(CommentDao.class);
            CommentDao mapper2 = openSession2.getMapper(CommentDao.class);
            Comment emp = mapper.selectByCommentsId(1);
            System.out.println(emp);
            openSession.close();
            //第二次查询是从二级缓存中拿到的数据，并没有发送新的sql
            Comment emp2 = mapper2.selectByCommentsId(1);
            System.out.println(emp2);
            openSession2.close();
        }finally{

        }

    }
}

