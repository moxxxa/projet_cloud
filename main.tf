resource "azurerm_resource_group" "project_cloud" {
  name     = "project_cloud"
  location = "francecentral"

  tags {
    Owner = "Souissi Mohamed"
  }
}

resource "azurerm_storage_account" "project_cloud" {
  name                     = "storagecloudxx"
  resource_group_name      = "${azurerm_resource_group.project_cloud.name}"
  location                 = "francecentral"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_app_service_plan" "project_cloud" {
    name                = "cloudXXAppServicePlan"
    location            = "${azurerm_resource_group.project_cloud.location}"
    resource_group_name = "${azurerm_resource_group.project_cloud.name}"
    sku {
        tier = "Standard"
        size = "S1"
    }
}

resource "azurerm_app_service" "project_cloud" {
    name                = "cloudXXAppService"
    location            = "${azurerm_resource_group.project_cloud.location}"
    resource_group_name = "${azurerm_resource_group.project_cloud.name}"
    app_service_plan_id = "${azurerm_app_service_plan.project_cloud.id}"

    app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "10 LTS"
  }
  connection_string {
    name  = "Database"
    type  = "MySql"
    value = "Server=mysql-server-cloudxx.mydomain.com;Integrated Security=SSPI"
  }
}



resource "azurerm_mysql_server" "project_cloud" {
  name                = "mysql-server-cloudxx"
  location            = "${azurerm_resource_group.project_cloud.location}"
  resource_group_name = "${azurerm_resource_group.project_cloud.name}"

  sku_name = "B_Gen5_2"

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }


  administrator_login          = "esgi_cloud_admin"
  administrator_login_password = "Thebeststanpasswordever95"
  version                      = "5.7"
  ssl_enforcement              = "Disabled"
}

resource "azurerm_mysql_firewall_rule" "project_cloud" {
  name                = "office"
  resource_group_name = "${azurerm_resource_group.project_cloud.name}"
  server_name         = "${azurerm_mysql_server.project_cloud.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_mysql_database" "project_cloud" {
  name                = "cloud"
  resource_group_name = "${azurerm_resource_group.project_cloud.name}"
  server_name         = "${azurerm_mysql_server.project_cloud.name}"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_container_registry" "project_cloud" {
  name                     = "containerRegistryforjenkins"
  resource_group_name      = "${azurerm_resource_group.project_cloud.name}"
  location                 = "${azurerm_resource_group.project_cloud.location}"
  sku                      = "Standard"
  admin_enabled            = false
}



resource "azurerm_resource_group" "serverless" {
  name     = "azure-functions-cloudx-project"
  location = "francecentral"
}

resource "azurerm_storage_account" "serverless" {
  name                     = "serverlessprojectcloud"
  resource_group_name      = "${azurerm_resource_group.serverless.name}"
  location                 = "${azurerm_resource_group.serverless.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



resource "azurerm_app_service_plan" "serverless" {
  name                = "azure-functions-projectcloudxx-service-plan"
  location            = "${azurerm_resource_group.serverless.location}"
  resource_group_name = "${azurerm_resource_group.serverless.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "serverless" {
  name                      = "azure-functions-project-cloudxx"
  location            = "${azurerm_resource_group.serverless.location}"
  resource_group_name = "${azurerm_resource_group.serverless.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.serverless.id}"
  storage_connection_string = "${azurerm_storage_account.serverless.primary_connection_string}"
  version = "~3"
  app_settings = {
        FUNCTIONS_WORKER_RUNTIME = "node"
        WEBSITE_NODE_DEFAULT_VERSION = "~10"
        WEBSITE_RUN_FROM_PACKAGE = "1"
        AzureWebJobsDashboard = "DefaultEndpointsProtocol=https;AccountName=serverlessprojectcloud;AccountKey=MN5ACOvMl5A2k6QNXJO/ypT4igRttV3fCYhZ4Y4l9G51bkYCh+yyqp7o9hUmGEVPFM7pnm4fGLmS2JsJsRR+gA==;EndpointSuffix=core.windows.net"
        AzureWebJobsStorage = "DefaultEndpointsProtocol=https;AccountName=serverlessprojectcloud;AccountKey=MN5ACOvMl5A2k6QNXJO/ypT4igRttV3fCYhZ4Y4l9G51bkYCh+yyqp7o9hUmGEVPFM7pnm4fGLmS2JsJsRR+gA==;EndpointSuffix=core.windows.net"
  }
}

resource "azurerm_application_insights" "serverless" {
  name                = "azure-functions-project-cloudxx-appinsights"
  location            = "${azurerm_resource_group.serverless.location}"
  resource_group_name = "${azurerm_resource_group.serverless.name}"
  application_type    = "Node.JS"
}

output "instrumentation_key" {
  value = "${azurerm_application_insights.serverless.instrumentation_key}"
}

output "app_id" {
  value = "${azurerm_application_insights.serverless.app_id}"
}
