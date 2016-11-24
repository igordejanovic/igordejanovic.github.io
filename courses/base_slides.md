class: center, middle

# {{ title }}
{% if subtitle %}
## {{ subtitle }}
{% endif %}

.author[{{ author }}]

.small[{{ affiliation }}]

.small[Slajdovi u izradi]

.created[{{now|dtformat("%d.%m.%Y u %H:%M")}}]


---
{% block slides %}{% endblock %}
