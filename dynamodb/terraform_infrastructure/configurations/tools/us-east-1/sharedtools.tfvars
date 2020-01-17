#Required for jenkins pipeline. Environment name.
environment = "sharedtools"
market = "us"
aws_region = "us-east-1"
vet_role_access = "sharedtools"
VET_CLUSTER = "sharedtools"
deploy_account = "670880416023"
target_account = "284422666245"
account_name = "sharedtools"
s3_bucket = "mcd-vanguard-tools-tfstate" #Will be used to set backend.tf
s3_folder_project = "gtd" #Will be used to set backend.tf
s3_folder_region = "us-east-1" #Will be used to set backend.tf
s3_folder_type = "dynamodb" #Will be used to set backend.tf
s3_tfstate_file = "gtd-dynamodb.tfstate" #Will be used to set backend.tf

s3_data_activity = "import_data"
migration_type = "target"


readcapacity = "5"
writecapacity = "5"
read_capacity = "10"
write_capacity = "10"


tags {
#Mandatory tags
  Environment         = "US-EAST-SHARED-US-VET-AECP-CLUSTERINFRASTRUCTURE"
  GBL                 = "195500855387"
  ApplicationID       = "APP0012189"
  Owner               = "US-VET-INFRASUPPORT@us.mcd.com"
  "Patch Group"       = "Not-Patched-By-2W"
  "cpm backup"        = "mcds_us_daily_3_non_prod_284422666245"

#Additional tags
  Name                = "US-EAST-QA-US-VET-AECP-CLUSTERINFRASTRUCTURE"
  ManagedBy           = "Terraform"
  Cluster             = "TOOLS"
}


########Dynamodb Table Schema Type-A only with only HASH KEY########
#******************************************************************#

dynamodb_table_typeA = ["us_ipe16_restaurantpollingworker_StoreStatusTable","us_ipe16_OfferAssociationGroups","us_ipe16_OfferPropositions","us_ipe16_OfferPunchAcknowledge","us_ipe16_OfferPunchError","us_ipe16_OfferTemplates","us_ipe16_RedemptionCodes","us_ipe16_Voucher","us_ipe16_Sequence","us_ipe16_menu_outage","us_ipe16_GroupCodes","CA_IPE16_DCS_ECP_ID_Mapping"]
hash_key_typeA = ["RestaurantId","AssocGrpId","OfferPropositionID","TransactionId","TransactionId","TemplateID","RedemptionCode","VoucherID","SequenceName","RestaurantNumber","OfferPropositionId","dcsId"]
attribute_hash_key_typeA = ["N","S","S","S","S","S","S","S","S","N","S","S"]

########Dynamodb Table Schema Type-B with HASH KEY and RANGE KEY ########
#***********************************************************************#

dynamodb_table_typeB = ["us_ipe16_CustomerAssociations","us_ipe16_OfferWallet","us_ipe16_menu_sequence_import","us_ipe16_menu_sequence_activation","us_ipe16_menu_product","us_ipe16_menu_category"]
hash_key_typeB = ["CustomerId","CustomerId","Id","RestaurantNumber","Id","DayPart"]
attribute_hash_key_typeB = ["S","S","S","N","S","S"]
range_key_typeB = ["AssocGrpId","OfferId","Artifact","ActivationTime","SK","DisplayCategoryId"]
attribute_range_key_typeB = ["S","N","S","S","S","N"]
