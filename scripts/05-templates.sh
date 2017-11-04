#!/bin/bash
curl -X PUT -u ${ELASTICUSER}:${ELASTICPASS} -d @- ${ELASTICURL}/_template/sample_types <<EOF
{
  "order": 0,
  "template": "*",
  "settings": {},
  "mappings": {
    "_default_": {
      "properties": {
        "tsUnix": {
          "type": "long"
        },
        "accel_x": {
          "type": "float"
        },
        "accel_y": {
          "type": "float"
        },
        "accel_y": {
          "type": "float"
        },
        "gyro_x": {
          "type": "float"
        },
        "gyro_y": {
          "type": "float"
        },
        "gyro_y": {
          "type": "float"
        },
        "ir": {
          "type": "float"
        },
        "ir_filt": {
          "type": "float"
        },
        "red": {
          "type": "float"
        },
        "red_filt": {
          "type": "float"
        }
      }
    }
  }
}
EOF

