package com.sportsmeet.sports.back.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author XYX
 * @create 2021-11-22-23:36
 */
@Data
@Table(name="project")
@NameStyle(Style.normal)
public class Project {
   @Id
   private String p_id;
   private String p_name;
   private String p_sex;
;
}
