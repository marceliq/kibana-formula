# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "kibana/map.jinja" import kibana with context %}

# We directly serialize the config subtree into the YAML file.
{% if kibana.configfile == '/etc/kibana/kibana.yml' %}
kibana-create-config-folder:
  file.directory:
    - name: /etc/kibana
    - mode: 755
    - user: root
    - group: root
{% endif %}
kibana-config:
  file.serialize:
    - name: {{ kibana.configfile }}
    - mode: 644
    - user: root
    - group: root
    - dataset: {{ kibana.config }}
    - formatter: "YAML"
