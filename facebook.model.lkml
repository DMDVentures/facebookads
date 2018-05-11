connection: "31dover-bq"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: facebook {
  hidden: yes
  from: facebook_base
}
