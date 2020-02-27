# Given the "data.json" JSON file with content:
{ "properties": [
  { "name": "env_type"    , "value": "production" },
  { "name": "shell"       , "value": "/bin/sh" },
  { "name": "utf-8 poetry", "value": "ᚠᛇᚻ᛫ᛒᛦᚦ᛫ᚠᚱᚩᚠᚢᚱ᛫ᚠᛁᚱᚪ᛫ᚷᛖᚻᚹᛦᛚᚳᚢᛗ" }
]
, "policyMode" : "audit"
}
# Setting properties from "data.json" and policy mode to audit:
curl -H "X-API-Token: yourToken" -X POST  -H "Content-Type: application/json" https://rudder.example.com/rudder/api/latest/nodes/NodeID -d @properties.json

# Removing the key "utf-8 poetry" from the command line and updating the "env_type" one
curl -H "X-API-Token: yourToken" -X POST  -H "Content-Type: application/json" https://rudder.example.com/rudder/api/latest/nodes/NodeID -d '{ "properties": [{ "name":"utf-8 poetry", "value":""}, {"name":"env_type", "value":"deprovisioned"}] }'

# Removing the key "env_type" and changing "shell" and use default policy mode
curl -H "X-API-Token: yourToken" -X POST  https://rudder.example.com/rudder/api/latest/nodes/NodeID -d "properties=shell=/bin/false" -d "properties=env_type=" -d "policyMode=default"
