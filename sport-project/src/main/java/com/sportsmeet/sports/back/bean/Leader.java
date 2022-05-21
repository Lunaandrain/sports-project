package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-22:41
 */
@Data
@Table(name="leader")
@NameStyle(Style.normal)
public class Leader {
    @Id
    private String l_id;
    private String t_id;
    private String l_name;
    private String l_phone;
    private String l_identity;

}
