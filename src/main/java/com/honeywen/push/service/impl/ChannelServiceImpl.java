package com.honeywen.push.service.impl;

import com.honeywen.push.entity.Channel;
import com.honeywen.push.dao.ChannelMapper;
import com.honeywen.push.service.ChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author RYF
 * @Description 通道管理服务实现类
 * @Date 2019-05-07 22:51
 **/
@Service
public class ChannelServiceImpl implements ChannelService {

    @Autowired
    private ChannelMapper channelMapper;

    @Override
    public int addChannel(Channel channel) {
        //通道名称重复校验
        Channel channel1 = channelMapper.getChannelByName(channel);
        if(channel1 != null){
            return 1;
        }
        boolean flag = channelMapper.addChannel(channel);
        if(flag){
            return 0;
        }else{
            return -1;
        }
    }

    @Override
    public List<Channel> getChannel(Integer userid) {
        return channelMapper.getChannel(userid);
    }

    @Override
    public Channel getChannelById(Channel channel) {
        return channelMapper.getChannelById(channel);
    }

    @Override
    public int editChannel(Channel channel) {
        //通道名称重复校验
        Channel channel1 = channelMapper.getChannelByName(channel);
        if(channel1 != null && !channel1.getName().equals(channel.getOldname())){
            return 1;
        }
        boolean flag = channelMapper.editChannel(channel);
        if(flag){
            return 0;
        }else{
            return -1;
        }
    }

    @Override
    public int deleteChannelById(Channel channel) {
        boolean flag = channelMapper.deleteChannelById(channel);
        if(flag){
            return 0;
        }else{
            return -1;
        }
    }
}