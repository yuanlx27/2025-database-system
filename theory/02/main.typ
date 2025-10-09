#set enum(numbering: "a.")

#let solution(body) = block(inset: 0.5em)[
  *_Solution._* #body
]

== 2.14

#solution[
  + $Pi_("ID", "person_name")(sigma_("company_name" = "'BigBank'")("works"))$.

  + $Pi_("ID", "person_name", "city")(sigma_("company_name" = "'BigBank'")("employee" join "works"))$.

  + $Pi_("ID", "person_name", "street", "city")(sigma_("company_name" = "'BigBank'" and "salary" > 10000)("employee" join "works"))$.

  + $Pi_("ID", "person_name")("employee" join "company")$.
]
