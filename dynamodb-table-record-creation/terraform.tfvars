access_key = "Provide your access-key here"
secret_key = "Provide secret_key here"

/***********DynamoDBConfigurations************/
table_name 			= "table"
billing_mode 		= "PROVISIONED"
read_capacity		= 5
write_capacity		= 5
hash_key			= "Id"
attribute_type		= "S"
ttl_attribute_name 	= "TimeToExist"