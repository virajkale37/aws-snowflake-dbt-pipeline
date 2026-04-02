{% set col = 'booking_id', 'nights_booked','booking_amount' %}

select
    {% for col in col %}
        {{col}}
        {% if not loop.last %}, {% endif %}
    {% endfor %}
    from {{ ref('bronze_bookings') }}
    where nights_booked=1 