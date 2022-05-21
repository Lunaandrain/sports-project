package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-22:34
 */
@Data
@Table(name="admin")
@NameStyle(Style.normal)
public class Admin {
    @Id
    private String id;
    private String username;
    private String password;
    private String nickname;

}
