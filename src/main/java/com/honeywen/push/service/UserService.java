package com.honeywen.push.service;

import com.honeywen.push.entity.User;

import java.util.List;

/**
 * @author wangwei
 * @date 2019/5/5
 */
public interface UserService {

    List<User> findAll();

    void save(User user);

    void saveOrUpdate(User user);

    boolean isExist(String openId);

    List<String> findOpenIdList(String sendKey);

    /**
     * 保存到user_channel
     * @param userId
     * @param channelId
     */
    void saveToUserChannel(Integer userId, Integer channelId);

    boolean existUserChannel(Integer id, Integer integer);
}
