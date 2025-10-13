#import "@local/sysu-templates:0.1.0": report

#show: report.with(
  title: "实验三",
  subtitle: "数据库系统实验报告",
  student: (name: "元朗曦", id: "23336294"),
  institude: "计算机学院",
  major: "计算机科学与技术",
  class: "计八",
)

= 实验环境

+ 操作系统：Arch Linux 6.17.1

+ 数据库管理系统：MariaDB 12.0.2

运行

```sh
podman run --detach \
           --env MARIADB_ROOT_PASSWORD=your_password \
           --name mariadb-server \
           --publish 3306:3306 \
           mariadb:latest
```

创建一个带有 MariaDB 的 Podman 容器。与 Docker 不同，Podman 会将本地的普通用户映射到容器内的根用户，既保证了安全性，也省去了不必要的配置步骤。

= 实验内容

== 创建数据库以及表

用已掌握的方法创建订报管理子系统的数据库 DingBao，在 DingBao 数据库中用交互式界面操作方法或 create table 命令方式创建如下三个表的结构（表名及字段名使用括号中给出的英文名），并完成三个表（@tab-1、@tab-2、@tab-3）所示内容的输入，根据需要可自行设计输入更多的记录。

创建表结构时要求满足：报纸编码表（paper）以报纸编号（pno）为主键；顾客编码表（customer）以顾客编号（eno）为主键；报纸订阅表（cp）以报纸编号（pno）与顾客编号（eno）为主键，订阅份数（num）的默认值为 1。

#figure(
  caption: "报纸编码表（paper）",
  table(
    columns: 3,
    table.header("报纸编号（pno）", "报纸名称（pna）", "单价（ppr）"),
    "000001", "人民日报", "12.5",
    "000002", "解放军报", "14.5",
    "000003", "光明日报", "10.5",
    "000004", "青年报", "11.5",
    "000005", "扬子日报", "18.5",
  ),
) <tab-1>

#figure(
  caption: "顾客订阅表（cp）",
  table(
    columns: 3,
    table.header("顾客编号（eno）", "报纸编号（pno）", "订阅份数（num）"),
    "0001", "000001", "2",
    "0001", "000002", "4",
    "0001", "000005", "6",
    "0002", "000001", "2",
    "0002", "000003", "2",
    "0002", "000005", "2",
    "0003", "000003", "2",
    "0003", "000004", "4",
    "0004", "000001", "1",
    "0004", "000003", "3",
    "0004", "000005", "2",
    "0005", "000003", "4",
    "0005", "000002", "1",
    "0005", "000004", "3",
    "0005", "000005", "5",
    "0005", "000001", "4",
  ),
) <tab-2>

#figure(
  caption: "顾客编码表（customer）",
  table(
    columns: 3,
    table.header("顾客编号（eno）", "顾客姓名（cna）", "顾客地址（adr）"),
    "0001", "李涛", "无锡市解放东路 123 号",
    "0002", "钱金浩", "无锡市人民西路 234 号 ",
    "0003", "邓杰", "无锡市惠河路 432 号",
    "0004", "朱海红", "无锡市中山东路 432 号",
    "0005", "欧阳阳文", "无锡市中山东路 532 号",
  ),
) <tab-3>

#raw(block: true, lang: "sql", read("assets/dingbao.sql").split("\n").slice(0, 53).join("\n"))

== 创建和使用视图

+ 在 dingbao 数据库中创建含有顾客编号、顾客名称、报纸编号、报纸名称、订阅份数等信息的视图，视图名为 C_P_N。

  #raw(block: true, lang: "sql", read("assets/dingbao.sql").split("\n").slice(54, 67).join("\n"))

+ 修改已创建的视图 C_P_N，使其含报纸单价信息。

  #raw(block: true, lang: "sql", read("assets/dingbao.sql").split("\n").slice(83, 86).join("\n"))

+ 通过视图 C_P_N 查询“人民日报”被订阅的情况，能通过视图 C_P_N 实现对数据的更新操作吗？请尝试各种更新操作，例如修改某人订阅某报的份数，修改某报的名称等。

  #raw(block: true, lang: "sql", read("assets/dingbao.sql").split("\n").slice(87, 90).join("\n"))

+ 删除视图 C_P_N。

  #raw(block: true, lang: "sql", read("assets/dingbao.sql").split("\n").at(95))

完整代码见 `assets/dingbao.sql`。我们可以运行

```
mariadb -P 3306 -u root -p < assets/dingbao.sql
```

来执行脚本。运行结果如 @fig-1 所示。

#figure(
  caption: "SQL 脚本运行结果",
  image(width: 80%, "assets/images/20251013-100241.png"),
) <fig-1>
