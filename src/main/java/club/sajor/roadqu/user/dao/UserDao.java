package club.sajor.roadqu.user.dao;

import club.sajor.roadqu.user.model.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.springframework.stereotype.Service;

@Service(value = "userDao")
public interface UserDao {
    @Select("select * from users where username=#{username} and password=#{password} limit 1")
    public User login(@Param("username") String username, @Param("password") String password);

    @SelectKey(statement = "select replace(uuid(), '-', '')", before=true, keyColumn="userid", keyProperty="userid", resultType=String.class)
    @Insert("INSERT INTO users VALUES (#{userid}, #{username}, #{password}, #{userphone}, #{email}, #{sex}, #{userstate}, #{nickname}, #{usercount})")
    public void register(User user);

    @Select("select * from users where username=#{username} limit 1")
    public User findUserByName(String username);
}
