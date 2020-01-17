module "resource_tagging" {
  source             = "git::https://bitbucket.sharedtools.vet-tools.digitalecp.mcd.com/scm/vettm/resource-tagging.git?ref=0.1.1"
  tags               = "${var.tags}"
  environment        = "${var.environment}"
}
