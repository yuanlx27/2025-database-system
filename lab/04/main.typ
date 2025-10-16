#import "@local/sysu-templates:0.1.0": report

#show: report.with(
  title: "实验四",
  subtitle: "数据库系统实验报告",
  student: (name: "元朗曦", id: "23336294"),
  institude: "计算机学院",
  major: "计算机科学与技术",
  class: "计八",
)

= 实验环境

+ 操作系统：Arch Linux 6.17.1

+ 数据库管理系统：MariaDB 12.0.2 in Podman 5.6.2

= 实验内容

== 创建

我们基于教材#footnote[MySQL 数据库技术与实验指导. (2012). 清华大学出版社.]第 50 页的描述创建 jxgl 数据库：

#raw(block: true, lang: "sql", read("assets/jxgl.sql"))

== 查询

+ 基于 jxgl 数据库，使用 SQL 语句表达以下查询：

  + 检索年龄大于 23 岁的男学生的学号和姓名；

    #raw(block: true, lang: "sql", read("assets/query.sql").split("\n").slice(2, 5).join("\n"))

  + 检索至少选修一门课程的女学生姓名；

    #raw(block: true, lang: "sql", read("assets/query.sql").split("\n").slice(6, 9).join("\n"))

  + 检索王林不学的课程的课程号；

    #raw(block: true, lang: "sql", read("assets/query.sql").split("\n").slice(10, 17).join("\n"))

  + 检索至少选修两门课程的学生学号；

    #raw(block: true, lang: "sql", read("assets/query.sql").split("\n").slice(18, 21).join("\n"))

  + 检索全部学生都选修的课程的课程号和课程名；

    #raw(block: true, lang: "sql", read("assets/query.sql").split("\n").slice(22, 25).join("\n"))

  + 检索选修了所有 3 学分课程的学生平均成绩。

    #raw(block: true, lang: "sql", read("assets/query.sql").split("\n").slice(26, 34).join("\n"))

+ 基于 jxgl 数据库，使用 SQL 语句表达以下查询：

  + 统计有学生选修的课程门数；

  + 求选修 4 号课程的学生的平均年龄；

  + 求学分为 3 的每门课程的学生平均成绩；

  + 统计每门课程的学生选修人数，要求超过3人的课程才统计，要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列；

  + 检索学号比“王林”同学大而年龄比她小的学生姓名；

  + 检索姓名以“王”开头的所有学生的姓名和年龄；

  + 在 sc 表中检索成绩为空值的学生的学号和课程号；

  + 求年龄大于女学生平均年龄的男学生的姓名和年龄；

  + 求年龄大于所有女学生年龄的男学生的姓名和年龄；

  + 检索选修 4 门以上课程的学生总成绩(不统计不及格课程)，并要求按总成绩的降序排列出来。

完整代码见 `assets/jxgl.sql` 和 `assets/query.sql`。
