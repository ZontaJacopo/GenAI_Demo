connection: "bigquery_demo_marketingcampaign"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: genai_customerpersonality_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: genai_customerpersonality_default_datagroup

explore: marketing_campaign {

}
