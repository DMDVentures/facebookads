connection: "31dover-bq"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: facebook {
  from: facebook_base
  join: outbound_clicks {
    type: left_outer
    sql_on: ${facebook.ad_id} = ${outbound_clicks.ad_id}
    AND ${facebook.date_raw} = ${outbound_clicks.date_raw} ;;
    relationship: one_to_one
  }
}
