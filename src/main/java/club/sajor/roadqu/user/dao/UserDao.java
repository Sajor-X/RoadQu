package club.sajor.roadqu.user.dao;

import club.sajor.roadqu.user.model.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

@Service(value = "userDao")
public interface UserDao {
    @Select("select * from users where username=#{username} and password=#{password} limit 1")
    User login(@Param("username") String username, @Param("password") String password);

    @SelectKey(statement = "select replace(uuid(), '-', '')", before=true, keyColumn="userid", keyProperty="userid", resultType=String.class)
    @Insert("INSERT INTO users VALUES (#{userid}, #{username}, #{password}, #{userphone}, #{email}, #{sex}, #{userstate}, #{nickname}, #{usercount})")
    void register(User user);

    @Select("select * from users where username=#{username} limit 1")
    User findUserByName(String username);

    @Update("update users set password=#{password} where userid = #{userid}")
    void chagePassword(@Param("password") String password, @Param("userid") String userid);

    @Update("update users set userphone=#{userphone}, sex=#{sex}, userstate=#{userstate}, nickname=#{nickname}, email=#{email} where userid=#{userid}")
    void userUpdate(User user);

    @Select("select * from users where userid=#{userid}")
    User findUserById(String userid);
}
