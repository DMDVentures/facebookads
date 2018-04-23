connection: "connection_name"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: facebook {
  from: facebook_base
}
