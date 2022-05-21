package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-23:34
 */
@Data
@Table(name="matchschdule")
@NameStyle(Style.normal)
public class MatchSchdule {
    @Id
    private String g_id;
    private String match_type;
    private String age_id;
    private String p_name;
    private String age_name;
    private String p_id;

}
