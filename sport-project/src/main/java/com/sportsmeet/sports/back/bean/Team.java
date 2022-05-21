package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-23:51
 */
@Data
@Table(name="team")
@NameStyle(Style.normal)
public class Team {
    @Id
    private String t_id;
    private String t_name;
    private String username;
    private String password;
}
