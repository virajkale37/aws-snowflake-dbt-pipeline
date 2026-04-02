{% set configs = [
    {
    "table": "AIRBNB.GOLD.OBT",
    "columns": "GOLD_OBT.BOOKING_ID, GOLD_OBT.LISTING_ID, GOLD_OBT.HOST_ID,GOLD_OBT.TOTAL_BOOKING_AMOUT, GOLD_OBT.SERVICE_FEE, GOLD_OBT.CLEANING_FEE, GOLD_OBT.ACCOMMODATES, GOLD_OBT.BEDROOMS, GOLD_OBT.BATHROOMS, GOLD_OBT.RESPONSE_RATE",
    "alias": "GOLD_OBT"
    },

    {
    "table": "AIRBNB.GOLD.DIM_LISTINGS",
    "columns": "",
    "alias": "GOLD_LISTINGS",
    "join_condition": "GOLD_OBT.LISTING_ID = GOLD_LISTINGS.LISTING_ID"
    },

    {
    "table": "AIRBNB.SILVER.SILVER_HOSTS",
    "columns": "",
    "alias": "GOLD_HOSTS",
    "join_condition": "GOLD_OBT.HOST_ID = GOLD_HOSTS.HOST_ID"
    }
] %}


SELECT 
        {{configs[0]['columns']}} 

    FROM
    {% for config in configs %}
        {% if loop.first %} 
            {{ config['table'] }} AS {{ config['alias'] }}
        {% else %}
            LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}   
            ON {{ config['join_condition'] }}
        {% endif %}
    {% endfor %}
