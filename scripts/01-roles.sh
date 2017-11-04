#!/bin/bash
# 
# Create a role that has full rights over the data
#
curl -X POST -u ${ELASTICUSER}:${ELASTICPASS} -d @- ${ELASTICURL}/_xpack/security/role/canaria_admin <<EOF
{
  "cluster": ["all"],
  "indices": [
    {
      "names": [ "canaria", "users", "sample-*" ],
      "privileges": ["all"]
    }
  ]
}
EOF

#
# 
curl -X POST -u ${ELASTICUSER}:${ELASTICPASS} -d @- ${ELASTICURL}/_xpack/security/user/playbook <<EOF
{
  "password" : "LendMeYourEars",
  "roles" : [ "admin", "canaria_admin" ],
  "full_name" : "Canaria Admin",
  "email" : "canaria@accelerando.com.au"
}
EOF
