view: marketing_campaign {
  sql_table_name: `looker_demo.marketing_campaign` ;;
  drill_fields: [Customer_id]

  dimension: Customer_id {
    primary_key: yes
    type: number
    description: "Customer's unique identifier"
    sql: ${TABLE}.ID ;;
  }
  dimension: accepted_cmp1 {
    type: yesno
    description: "true if customer accepted the offer in the 1st campaign, false otherwise"
    sql: ${TABLE}.AcceptedCmp1 ;;
  }
  dimension: accepted_cmp2 {
    type: yesno
    description: "true if customer accepted the offer in the 2nd campaign, false otherwise"
    sql: ${TABLE}.AcceptedCmp2 ;;
  }
  dimension: accepted_cmp3 {
    type: yesno
    description: "true if customer accepted the offer in the 3rd campaign, false otherwise"
    sql: ${TABLE}.AcceptedCmp3 ;;
  }
  dimension: accepted_cmp4 {
    type: yesno
    description: "true if customer accepted the offer in the 4th campaign, false otherwise"
    sql: ${TABLE}.AcceptedCmp4 ;;
  }
  dimension: accepted_cmp5 {
    type: yesno
    description: "true if customer accepted the offer in the 5th campaign, false otherwise"
    sql: ${TABLE}.AcceptedCmp5 ;;
  }
  dimension: complain {
    type: yesno
    description: "true if the customer complained in the last 2 years, false otherwise"
    sql: ${TABLE}.Complain ;;
  }
  dimension_group: dt_customer {
    type: time
    description: "Date of customer's enrollment with the company"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Dt_Customer ;;
  }
  dimension: education {
    type: string
    description: "Customer's education level"
    sql: ${TABLE}.Education ;;
  }
  dimension: income {
    type: number
    description: "Customer's yearly household income"
    sql: ${TABLE}.Income ;;
  }
  dimension: kidhome {
    type: number
    description: "Number of children in customer's household"
    sql: ${TABLE}.Kidhome ;;
  }
  dimension: marital_status {
    type: string
    description: "Customer's marital status"
    sql: ${TABLE}.Marital_Status ;;
  }
  dimension: Spesa_Prodotti_Ittici{
    type: number
    description: "Amount spent on fish in last 2 years"
    sql: ${TABLE}.MntFishProducts ;;
  }
  dimension: Spesa_frutta {
    type: number
    description: "Amount spent on fruits in last 2 years"
    sql: ${TABLE}.MntFruits ;;
  }
  dimension: Spesa_prodotti_oro {
    type: number
    description: "Amount spent on gold in last 2 years"
    sql: ${TABLE}.MntGoldProds ;;
  }
  dimension: Spesa_carne {
    type: number
    description: "Amount spent on meat in last 2 years"
    sql: ${TABLE}.MntMeatProducts ;;
  }
  dimension: Spesa_prodotti_dolci {
    type: number
    description: "Amount spent on sweets in last 2 years"
    sql: ${TABLE}.MntSweetProducts ;;
  }
  dimension: Spesa_vino {
    type: number
    description: "Amount spent on wine in last 2 years"
    sql: ${TABLE}.MntWines ;;
  }
  dimension: num_catalog_purchases {
    type: number
    description: "Number of purchases made using a catalogue"
    sql: ${TABLE}.NumCatalogPurchases ;;
  }
  dimension: num_deals_purchases {
    type: number
    description: "Number of purchases made with a discount"
    sql: ${TABLE}.NumDealsPurchases ;;
  }
  dimension: Acquisti_InNegozio {
    type: number
    description: "Number of purchases made directly in stores"
    sql: ${TABLE}.NumStorePurchases ;;
  }
  dimension: Acquisti_Online {
    type: number
    description: "Number of purchases made through the company’s website"
    sql: ${TABLE}.NumWebPurchases ;;
  }
  dimension: num_web_visits_month {
    type: number
    description: "Number of visits to company’s website in the last month"
    sql: ${TABLE}.NumWebVisitsMonth ;;
  }
  dimension: recency {
    type: number
    description: "Number of days since customer's last purchase"
    sql: ${TABLE}.Recency ;;
  }
  dimension: response {
    type: yesno
    description: "true if customer accepted the offer in the last campaign, false otherwise"
    sql: ${TABLE}.Response ;;
  }
  dimension: teenhome {
    type: number
    description: "Number of teenagers in customer's household"
    sql: ${TABLE}.Teenhome ;;
  }
  dimension: year_birth {
    type: number
    description: "Customer's birth year"
    sql: ${TABLE}.Year_Birth ;;
  }

  dimension: Customer_name {
    type: string
    description: "Customer's name"
    sql: ${TABLE}.Customer_Name ;;
  }
  dimension: Region {
    type: string
    description: "Customer's region"
    sql: ${TABLE}.Region ;;
  }
  measure: count {
    type: count
  }

  measure: Customer_count {
    type: count_distinct
    sql:  ${Customer_id} ;;

  }

  measure: Income{
    type: average
    sql:  ${income} ;;

  }

  measure: SpesaMedia_frutta {
    type: average
    sql: ${Spesa_frutta} ;;
    value_format_name: eur_0
  }

  measure: SpesaMedia_carne {
    type: average
    sql: ${Spesa_carne} ;;
    value_format_name: eur_0
  }

  measure: SpesaMedia_pesce {
    type: average
    sql: ${Spesa_Prodotti_Ittici} ;;
    value_format_name: eur_0
  }

  measure: SpesaMedia_oro {
    type: average
    sql: ${Spesa_prodotti_oro} ;;
    value_format_name: eur_0
  }

  measure: SpesaMedia_vino {
    type: average
    sql: ${Spesa_vino} ;;
    value_format_name: eur_0
  }

  measure: SpesaMedia_dolci {
    type: average
    sql: ${Spesa_prodotti_dolci} ;;
    value_format_name: eur_0
  }

  measure: EtaMedia {
    type: average
    sql: EXTRACT(YEAR FROM Current_date())-${year_birth};;
  }

  measure: SpesaOnline {
    type: sum
    sql: ${Acquisti_Online};;
  }

  measure: SpesaNegozio {
    type: sum
    sql: ${Acquisti_InNegozio};;
  }


}
