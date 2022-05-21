package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-12-01-21:57
 */
@Data
@Table(name="teamdegree")
@NameStyle(Style.normal)
public class TeamDegree {
    private String t_id;
    private String age_id;
    private String teamdegree;
}
