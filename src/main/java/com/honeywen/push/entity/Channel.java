package com.honeywen.push.entity;

import lombok.Data;

import java.util.List;

/**
 * @Author RYF
 * @Description 通道实体列 物理表 channel
 * @Date 2019-05-07 22:40
 **/
public @Data class Channel {

    /**
     * 主键
     */
    private Integer id;

    /**
     * 通道名称
     */
    private String name;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 通道创建者ID
     */
    private Integer userId;

    /**
     * 通道sendkey
     */
    private String sendKey;

    /**
     * 是否禁用
     */
    private String isforbidden;

    /**
     * 原有用户名-非字段
     */
    private String oldname;

    /**
     * 通道的二维码ticket
     */
    private String ticket;

    private String qrcodeUrl;


    public String getQrcodeUrl() {
        return "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + this.getTicket();
    }


    /**
     * 通道订阅者
     */
    public List<User> subscribeList;

}
