cat disable-datasource-1.json.json
{
  "description": "This data source is temporarly no more used and so disabled",
  "enabled": false
}

curl -H "X-API-Token: yourToken" -X POST http://rudder.example.com/rudder/api/latest/datasources/DataSourceID -H "Content-type: application/json" -d @disable-datasource-1.json.json